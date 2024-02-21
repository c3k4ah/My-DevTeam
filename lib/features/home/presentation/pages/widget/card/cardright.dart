import 'package:flutter/material.dart';

class CardRight extends StatelessWidget {
  const CardRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style:
                    TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                child: Text(
                  "C'est un projet de plateforme de musique qui permettra aux artistes de partager leur musique et aux utilisateurs d'écouter de la musique.",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Manager',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.black26),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    'Serge Ramamonjisoa',
                    style: TextStyle(
                        fontWeight: FontWeight.w800, color: Colors.black54),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.black26),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'serge.rama46@gmail.com',
                      style: TextStyle(
                          fontWeight: FontWeight.w800, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
