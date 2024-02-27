import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// import '../../../../core/styles/app_colors.dart';
import '../../../../core/DTO/models/page_propriety_model.dart';
import '../../../../core/routes/app_router.dart';

import '../widgets/sidebar.dart';
import '../widgets/icon_boutton.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeColor = Theme.of(context).extension<AppColors>()!;
    return AutoTabsRouter(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (context, child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      routes: const [
        // ProjectDetailsRoute(
        //     project: ProjectEntity(
        //   progression: 2,
        //   title: "My DevTeam",
        //   members: const ["memebre 1", "membre 2"],
        //   description: "Projet de soutenance",
        //   starDate: DateTime.now(),
        //   endDate: DateTime.now(),
        //   created: DateTime.now(),
        // )),

        HomeRoute(),
        ProjectRoute(),
        CalendarRoute(),
        ChatRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        final activeIndex = tabsRouter.activeIndex;
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 240, 240, 240),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Row(
              children: [
                Sidebar(
                  children: [
                    ...List.generate(tabsRouter.pageCount, (index) {
                      List<AutoRoute> listOf =
                          tabsRouter.routeCollection.routes.toList();
                      PagePropriety routeInfo =
                          PagePropriety.fromMap(listOf[index].meta);
                      return SelectedIconButton(
                        onTap: () => tabsRouter.setActiveIndex(index),
                        isSelected: index == activeIndex,
                        icon: routeInfo.pageIcon,
                      );
                    }),
                  ],
                ),
                Expanded(child: child),
              ],
            ),
          ),
        );
      },
    );
  }
}
