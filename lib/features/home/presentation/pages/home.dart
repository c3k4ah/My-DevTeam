import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// import '../../../../core/styles/app_colors.dart';

import 'widget/card/card.dart';
import 'widget/edt.dart';
import 'widget/calendar_header.dart';
import 'widget/widgetwithcalendar/calendar.dart';

import 'widget/widgetwithcalendar/doctor.dart';
import 'widget/widgetwithcalendar/someone.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                          Expanded(child: Edt())
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
