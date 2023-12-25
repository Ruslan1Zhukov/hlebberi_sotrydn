import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';

class DividerProject extends StatelessWidget {
  const DividerProject({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 0.5,
      height: 1,
      color: ColorProject.grey,
    );
  }
}
