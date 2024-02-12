import 'package:flutter/material.dart';

Color hexToColor(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  int intValue = int.parse(hexColor, radix: 16);
  return Color(intValue).withOpacity(1.0);
}