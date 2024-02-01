
import 'package:flutter/material.dart';

toast(BuildContext? context, String? text) {
  if (context == null || text == null) return;
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}