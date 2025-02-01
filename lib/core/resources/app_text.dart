import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Font sizes for consistent scaling
class FontSizes {
  static const double displayLarge = 24;
  static const double displayMedium = 18;
  static const double displaySmall = 15;
  static const double headlineLarge = 14;
  static const double headlineMedium = 14;
  static const double headlineSmall = 14;
  static const double titleLarge = 14;
  static const double titleMedium = 14;
  static const double titleSmall = 14;
  static const double bodyLarge = 12;
  static const double bodyMedium = 12;
  static const double bodySmall = 12;
  static const double labelLarge = 11;
  static const double labelMedium = 11;
  static const double labelSmall = 11;
}

/// Font weights for consistent typography
class FontWeights {
  static const FontWeight bold = FontWeight.w600;
  static const FontWeight semiBold = FontWeight.w500;
  static const FontWeight medium = FontWeight.w400;
}

/// AppTextTheme provides consistent typography throughout the app
class AppTextTheme {
  static TextTheme get textTheme => TextTheme(
        displayLarge: _specialFontStyle(
          fontSize: FontSizes.displayLarge,
          fontWeight: FontWeights.bold,
          color: AppColors.black,
        ),
        displayMedium: _textStyle(
          fontSize: FontSizes.displayMedium,
          fontWeight: FontWeights.semiBold,
          color: AppColors.black,
        ),
        displaySmall: _textStyle(
          fontSize: FontSizes.displaySmall,
          fontWeight: FontWeights.semiBold,
          color: AppColors.black,
        ),
        headlineLarge: _specialFontStyle(
          fontSize: FontSizes.headlineLarge,
          fontWeight: FontWeights.bold,
          color: AppColors.black,
        ),
        headlineMedium: _specialFontStyle(
          fontSize: FontSizes.headlineMedium,
          fontWeight: FontWeights.semiBold,
          color: AppColors.black,
        ),
        headlineSmall: _textStyle(
          fontSize: FontSizes.headlineSmall,
          fontWeight: FontWeights.medium,
          color: AppColors.black,
        ),
        titleLarge: _textStyle(
          fontSize: FontSizes.titleLarge,
          fontWeight: FontWeights.bold,
          color: AppColors.black,
        ),
        titleMedium: _textStyle(
          fontSize: FontSizes.titleMedium,
          fontWeight: FontWeights.semiBold,
          color: AppColors.black,
        ),
        titleSmall: _textStyle(
          fontSize: FontSizes.titleSmall,
          fontWeight: FontWeights.medium,
          color: AppColors.black,
        ),
        bodyLarge: _textStyle(
          fontSize: FontSizes.bodyLarge,
          fontWeight: FontWeights.bold,
          color: AppColors.black,
        ),
        bodyMedium: _textStyle(
          fontSize: FontSizes.bodyMedium,
          fontWeight: FontWeights.semiBold,
          color: AppColors.black,
        ),
        bodySmall: _textStyle(
          fontSize: FontSizes.bodySmall,
          fontWeight: FontWeights.medium,
          color: AppColors.black,
        ),
        labelLarge: _textStyle(
          fontSize: FontSizes.labelLarge,
          fontWeight: FontWeights.bold,
          color: AppColors.black,
        ),
        labelMedium: _textStyle(
          fontSize: FontSizes.labelMedium,
          fontWeight: FontWeights.semiBold,
          color: AppColors.black,
        ),
        labelSmall: _textStyle(
          fontSize: FontSizes.labelSmall,
          fontWeight: FontWeights.medium,
          color: AppColors.black,
        ),
      );

  /// General text style with Roboto font
  static TextStyle _textStyle({
    required double fontSize,
    FontWeight fontWeight = FontWeights.semiBold,
    required Color color,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Special text style with Atma font
  static TextStyle _specialFontStyle({
    required double fontSize,
    FontWeight fontWeight = FontWeights.semiBold,
    required Color color,
  }) {
    return GoogleFonts.atma(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
