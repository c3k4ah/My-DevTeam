import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color? primaryColor;
  final Color? dominantColor;
  final Color? secondaryColor;
  final Color? backGroundColor;
  final Color? textColor;
  const AppColors({
    this.primaryColor,
    this.dominantColor,
    this.secondaryColor,
    this.backGroundColor,
    this.textColor,
  });
  @override
  AppColors copyWith({
    Color? primaryColor,
    Color? dominantColor,
    Color? secondaryColor,
    Color? backGroundColor,
    Color? textColor,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      dominantColor: dominantColor ?? this.dominantColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backGroundColor: backGroundColor ?? this.backGroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      dominantColor: Color.lerp(dominantColor, other.dominantColor, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      backGroundColor: Color.lerp(backGroundColor, other.backGroundColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
    );
  }
}
