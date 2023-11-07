import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hlebberi_sotrydn/model/user.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/redux/thunk/account.dart';
import 'package:hlebberi_sotrydn/widgets/avatar.dart';
import 'package:hlebberi_sotrydn/widgets/location.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, User?>(
      converter: (store) => store.state.account.user,
      builder: (BuildContext context, User? user) {
        if (user == null) {
          return const Text("Не найден пользователь");
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 20),
                AvatarWidget(user: user),
                const SizedBox(width: 14),
                Expanded(child: _buildTitle(user)),
                const _ButtonOut(),
              ],
            ),
            const SizedBox(height: 12),
            LocationWidget(user: user),
          ],
        );
      },
    );
  }

  Column _buildTitle(User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.fio.fullFio(),
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        Text(
          user.jobTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _ButtonOut extends StatelessWidget {
  const _ButtonOut();

  _showDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => const _Dialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showDialog(context),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 20,
        ),
        child: const Icon(
          Icons.settings,
          size: 24.0,
        ),
      ),
    );
  }

}

class _Dialog extends StatelessWidget {
  const _Dialog();

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
