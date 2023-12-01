import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/helpers/dialogs.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text(
        'Выйти из аккаунта',
        style: TextStyle(
          color: ColorProject.black,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
      onTap: () => showLogoutDialog(context),
    );
  }
}
