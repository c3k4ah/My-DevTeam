import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HeaderCalendar extends StatelessWidget {
  const HeaderCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'My DevTeam',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            children: [
              // InkWell(
              //   onTap: () {},
              //   child: Container(
              //     width: 150,
              //     height: 50,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       color: Colors.blue,
              //     ),
              //     child: const Center(
              //       child: Text(
              //         '+ Nouveau projet',
              //         style: TextStyle(color: Colors.white),
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   width: 10,
              // ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 231, 228, 228),
                ),
                child: const Icon(
                  Ionicons.notifications,
                  color: Colors.blue,
                  size: 20,
                ),
              ),
              // const SizedBox(
              //   width: 10,
              // ),
              // const UserProfilePhotoWidget(),
              const SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}
