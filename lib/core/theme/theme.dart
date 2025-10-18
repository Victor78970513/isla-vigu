import 'package:flutter/material.dart';
import 'package:isla_vigu/core/theme/app_colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    sliderTheme: SliderThemeData(
      overlayShape: SliderComponentShape.noOverlay,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
      trackHeight: 8.0,
    ),
  );
}
