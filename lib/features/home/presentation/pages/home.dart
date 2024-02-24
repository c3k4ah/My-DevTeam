import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydevteam/features/home/presentation/manager/home_bloc.dart';

// import '../../../../core/styles/app_colors.dart';

import 'widget/card/card.dart';
// ignore: unused_import
import 'widget/chedule.dart';
import 'widget/calendar_header.dart';
import 'widget/mini_calendar/calendar.dart';

import 'widget/mini_calendar/doctor.dart';
import 'widget/mini_calendar/someone.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderCalendar(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Column(
                        children: [
                          CardWidget(),
                          SizedBox(
                            height: 10,
                          ),
                          // Expanded(child: Edt())
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20).copyWith(top: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 350,
                    height: MediaQuery.of(context).size.height,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Calendar(),
                        SizedBox(
                          height: 20,
                        ),
                        Doctor(),
                        SizedBox(
                          height: 15,
                        ),
                        Someone(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
