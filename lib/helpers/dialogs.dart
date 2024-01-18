import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/helpers/picker.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/redux/thunk/account.dart';

showLogoutDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text("Внимание!"),
      content: const Text("Вы уверены, что хотите выйти из аккаунта?"),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          isDefaultAction: true,
          child: const Text("Отмена"),
        ),
        CupertinoDialogAction(
          onPressed: () => store.dispatch(logout(context)),
          isDestructiveAction: true,
          child: const Text("Выйти"),
        ),
      ],
    ),
  );
}

showAddAvatarDialog(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: const Text('Выберите действие'),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text('Сделать фото с камеры'),
          onPressed: () {

            /// Чтобы открывалась камера и кидала в обрезание
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('Выбрать из галереи'),
          onPressed: () {
            Navigator.pop(context);
            pickImage(context);
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Отмена'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
  );
}

showChangeAvatarDialog(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context2) => CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text('Открыть галерею'),
          onPressed: () {
            Navigator.pop(context2);
            pickImage(context);
          },
        ),
        CupertinoActionSheetAction(
          child: const Text(
            'Удалить фото',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.pop(context2);
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context2);
        },
        child: const Text('Отмена'),
      ),
    ),
  );
}