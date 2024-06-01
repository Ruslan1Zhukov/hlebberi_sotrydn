import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';

Future<void> toast(
    BuildContext? context,
    String? text, [
      ToastType type = ToastType.normal,
    ]) async {
  if (context == null || text == null) return;
  if (text.isEmpty) return;
  final snackBar = SnackBar(
    backgroundColor: type.colorBg,
    content: Text(text),
  );
  await ScaffoldMessenger.of(context).showSnackBar(snackBar).closed;
}

final _mapColorBackground = {
  ToastType.success: ColorProject.green,
  ToastType.error: ColorProject.error,
};

enum ToastType {
  normal,
  success,
  error;

  Color? get colorBg => _mapColorBackground[this];
}
