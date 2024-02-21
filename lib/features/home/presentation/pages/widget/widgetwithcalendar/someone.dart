import 'package:flutter/material.dart';

class Someone extends StatelessWidget {
  const Someone({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset(
                'assets/images/personne.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stephano Ras',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                ),
                Text(
                  'Developer',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
