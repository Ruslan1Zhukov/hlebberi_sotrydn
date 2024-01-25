import 'package:camera/camera.dart';
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


/// Чтобы открывалась камера и кидала в обрезание

showAddAvatarDialog(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: const Text('Выберите действие'),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text('Сделать фото с камеры'),
          onPressed: () async {
            List<CameraDescription> cameras = await availableCameras();
            CameraController controller = CameraController(cameras[0], ResolutionPreset.medium);
            await controller.initialize();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraScreen(controller),
              ),
            );
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

class CameraScreen extends StatefulWidget {
  final CameraController controller;

  CameraScreen(this.controller);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  void initState() {
    super.initState();
    widget.controller.startImageStream((CameraImage image) {
    });
  }

  @override
  void dispose() {
    widget.controller.stopImageStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Screen'),
      ),
      body: CameraPreview(widget.controller),
    );
  }
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