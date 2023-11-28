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
        // CupertinoActionSheetAction(
        //   child: const Text('Сделать фото с камеры'),
        //   onPressed: () {
        //     // TODO: Реализовать функционал камеры
        //     Navigator.pop(context);
        //   },
        // ),
        CupertinoActionSheetAction(
          child: const Text('Выбрать из галереи'),
          onPressed: () {
            Navigator.pop(context);
            pickImage();
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
    builder: (BuildContext context) => CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text('Открыть галерею'),
          onPressed: () {
            Navigator.pop(context);
            pickImage();
          },
        ),
        CupertinoActionSheetAction(
          child: const Text(
            'Удалить фото',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Отмена'),
      ),
    ),
  );
}