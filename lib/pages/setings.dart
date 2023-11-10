import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/redux/thunk/account.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:hlebberi_sotrydn/theme/scaffold.dart';
import 'package:hlebberi_sotrydn/widgets/header.dart';

class SetingsPage extends StatelessWidget {
  const SetingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldProject(
      isQRScan: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Positioned(
                    top: 20,
                    right: 20,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: ColorProject.orange,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(Icons.keyboard_arrow_left),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Информация",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const HeaderWidget(isNeedSettings: false),
              const SizedBox(height: 40),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Пользовательское соглашение'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                },
              ),
              ListTile(
                leading: const Icon(Icons.gavel),
                title: const Text('Правовые документы'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                },
              ),
              ListTile(
                leading: const Icon(Icons.feedback),
                title: const Text('Обратная связь'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Выйти из аккаунта',
                style: TextStyle(color: ColorProject.orange),),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const _Dialog()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dialog extends StatelessWidget {
  const _Dialog();

  _showDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => const _Dialog(),
    );
  }

  _logout(BuildContext context) async {
    await store.dispatch(logout(context));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text("Внимание!"),
      content: const Text("Вы уверены, что хотите выйти из аккаунта?"),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          isDefaultAction: true,
          child: const Text("Отмена"),
        ),
        CupertinoDialogAction(
          onPressed: () => _logout(context),
          isDestructiveAction: true,
          child: const Text("Выйти"),
        ),
      ],
    );
  }
}
