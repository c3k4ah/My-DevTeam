import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Sidebar extends StatelessWidget {
  final List<Widget> children;
  const Sidebar({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 700,
        width: 70,
        decoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(15),
          color: Colors.blue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/logo_white.png',
              height: 50,
              width: 50,
            ),
            const SizedBox(
              height: 150,
            ),
            ...children,
            const Expanded(flex: 1, child: SizedBox()),
            const Icon(
              Ionicons.settings,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            const Icon(
              Ionicons.power,
              size: 20,
              color: Colors.white,
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }
}
