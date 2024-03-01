import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

void showDeleteProjectDialogue({
  required BuildContext context,
  required VoidCallback confirm,
}) {
  showAdaptiveDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        // contentPadding: const EdgeInsets.all(10),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 200,
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent,
                  ),
                  child: const Icon(
                    Ionicons.trash,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Voulez-vous vraiment supprimer ce projet ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      elevation: 0,
                      onPressed: () {
                        confirm();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Oui'),
                    ),
                    MaterialButton(
                      elevation: 0,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Non'),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );
    },
  );
}
