import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle style34Bold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 34),
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontFamily: 'Inter',
    );
  }

  static TextStyle style28SemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 28),
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: 'Inter',
    );
  }
  static TextStyle style25SemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 25),
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: 'Inter',
    );
  }

  static TextStyle style22Medium(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 22),
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: 'Inter',
    );
  }
  static TextStyle style22SemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 22),
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: 'Inter',
    );
  }

  static TextStyle style17Medium(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 17),
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: 'Inter',
    );
  }

  static TextStyle style17Regular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 17),
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: 'Inter',
    );
  }

  static TextStyle style15Medium(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 15),
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: 'Inter',
    );
  }

  static TextStyle style15Regular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 15),
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: 'Inter',
    );
  }

  static TextStyle style13Medium(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 13),
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: 'Inter',
    );
  }

  static TextStyle style13Regular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 13),
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: 'Inter',
    );
  }

  static TextStyle style11Medium(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 11),
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: 'Inter',
    );
  }

  static TextStyle style11Regular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 11),
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: 'Inter',
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
