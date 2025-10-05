import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle style24W700Bold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 24),
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontFamily:  'Raleway',
    );
  }
  static TextStyle style16W600Bold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 16),
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily:  'Raleway',
    );
  }
  static TextStyle style22W700Bold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 22),
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontFamily:  'Raleway',
    );
  }
  static TextStyle style14W700Bold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 14),
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontFamily:  'Raleway',
    );
  } static TextStyle style14W500Medium(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 14),
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily:  'Raleway',
    );
  }
  static TextStyle style14W600SemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 14),
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily:  'Raleway',
    );
  }
  static TextStyle style13W400(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 13),
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily:  'Raleway',
    );
  }
  static TextStyle style12W500Bold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 12),
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily:  'Raleway',
    );
  }
  static TextStyle style12W600SemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 12),
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily:  'Raleway',
    );
  }
}

double getResponsiveScaleFactor(
  BuildContext context, {
  required double fontSize,
}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = responsiveFontSize * 0.8;
  double upperLimit = responsiveFontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  if (width <= 600) {
    return width / 400;
  } else if (width <= 1200) {
    return width / 1000;
  } else {
    return width / 1750;
  }
}
