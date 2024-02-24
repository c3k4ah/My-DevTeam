import 'package:auto_route/auto_route.dart';
import 'package:ionicons/ionicons.dart';
import '../../features/auth/presentation/auth_navigation_page.dart';
import '../../features/auth/presentation/sign_in/pages/login_page.dart';
import '../../features/auth/presentation/sign_in/manager/sign_in_bloc.dart';
import '../../features/chat/presentation/pages/chat_screen.dart';
import '../../features/event/presentation/pages/calendar_screen.dart';
import '../../features/home/presentation/pages/home.dart';
import '../../features/main_screen/presentation/pages/main_screen.dart';
import '../../features/project/presentation/pages/project_screen.dart';
import 'guards/auth_guard.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AuthStatus authenticated;

  AppRouter(this.authenticated);
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/main',
          page: MainRoute.page,
          initial: true,
          guards: [
            AuthGuard(authenticated),
          ],
          children: [
            AutoRoute(
              path: 'home',
              page: HomeRoute.page,
              meta: const {
                'title': 'Acceuil',
                'icon': Ionicons.home,
              },
            ),
            AutoRoute(
              path: 'project',
              page: ProjectRoute.page,
              meta: const {
                'title': 'Projets',
                'icon': Ionicons.folder,
              },
            ),
            AutoRoute(
              path: 'calendar',
              page: CalendarRoute.page,
              meta: const {
                'title': 'Calendrier',
                'icon': Ionicons.calendar,
              },
            ),
            AutoRoute(
              path: 'chat',
              page: ChatRoute.page,
              meta: const {
                'title': 'Chat',
                'icon': Ionicons.chatbox,
              },
            ),
          ],
        ),
        AutoRoute(
          path: '/login',
          page: LoginRoute.page,
        ),
      ];
}
