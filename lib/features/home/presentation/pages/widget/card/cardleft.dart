import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CardLeft extends StatelessWidget {
  const CardLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 340,
        height: 200,
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 70,
                    width: 70,
                    color: Colors.white,
                    child: const Icon(
                      Ionicons.folder_open,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Platfome Mozika',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'en cours ...',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Coilaborateurs',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.white60),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      '07',
                      style: TextStyle(
                          fontWeight: FontWeight.w800, color: Colors.white),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deadline',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.white60),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        '12/12/2024',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
