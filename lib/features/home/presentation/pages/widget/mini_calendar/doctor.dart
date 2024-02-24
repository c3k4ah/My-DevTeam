import 'package:flutter/material.dart';

class Doctor extends StatelessWidget {
  const Doctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Utilisateurs',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 40,
                  width: 40,
                  color: Colors.black12,
                  child: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
