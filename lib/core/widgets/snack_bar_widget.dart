import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String title,
  Color? titleColor,
  required Color color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        title,
        style: TextStyle(
          color: titleColor ?? Colors.white,
        ),
      ),
      backgroundColor: color,
    ),
  );
}
