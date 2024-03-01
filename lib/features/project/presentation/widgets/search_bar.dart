import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SearchBarWidget extends StatelessWidget {
  final Color? barColor;
  const SearchBarWidget({super.key, this.barColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: barColor ?? const Color.fromARGB(255, 236, 236, 236),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Ionicons.search,
            color: Colors.black38,
            size: 20,
          ),
          hintText: 'Faite votre recherche',
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
