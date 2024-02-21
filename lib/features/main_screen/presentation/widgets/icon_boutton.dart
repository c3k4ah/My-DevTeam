import 'package:flutter/material.dart';

class SelectedIconButton extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final VoidCallback onTap;
  const SelectedIconButton({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.blue : Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
