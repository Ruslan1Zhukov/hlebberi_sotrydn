import 'package:flutter/material.dart';

Color? hexToColor(String? hexColor) {
  if (hexColor == null) return null;
  if (hexColor.isEmpty) return null;
  try {
    hexColor = hexColor.replaceAll("#", "");
    int intValue = int.parse(hexColor, radix: 16);
    return Color(intValue).withOpacity(1.0);
  } catch (e) {
    return null;
  }
}