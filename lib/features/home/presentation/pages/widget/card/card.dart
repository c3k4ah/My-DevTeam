import 'package:flutter/material.dart';

import 'cardleft.dart';
import 'cardright.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //côté gauche
          CardLeft(),

          //côté droite
          Expanded(child: CardRight())
        ],
      ),
    );
  }
}
