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
          Container(
            padding: const EdgeInsets.only(left: 55),
            child: const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'My DevTeam',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Text(
                'Accueil',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                width: 20,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: 150,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        '+ Nouveau projet',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
              const SizedBox(
                width: 10,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    color: const Color.fromARGB(255, 231, 228, 228),
                    child: const Icon(
                      Ionicons.notifications,
                      color: Colors.blue,
                      size: 20,
                    ),
                  )),
              const SizedBox(
                width: 10,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: 50,
                    height: 50,
                    color: const Color.fromARGB(255, 231, 228, 228),
                    child: Image.asset(
                      'assets/images/personne.jpeg',
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(
                width: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
