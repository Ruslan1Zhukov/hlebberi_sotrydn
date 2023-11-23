import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/redux/thunk/account.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:hlebberi_sotrydn/theme/scaffold.dart';
import 'package:hlebberi_sotrydn/widgets/header.dart';
import 'package:image_picker/image_picker.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

void pickImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    File file = File(image.path);
    int sizeInBytes = file.lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);

    if (sizeInMb > 5) {
    } else {
    }
  }
}

Future<XFile?> compressFile(File file) async {
  final filePath = file.absolute.path;
  final lastIndex = filePath.lastIndexOf(RegExp(r'\.(jpg|jpeg|png)'));
  final outPath = "${filePath.substring(0, lastIndex)}_compressed.jpg";

  return await FlutterImageCompress.compressAndGetFile(
    filePath,
    outPath,
    quality: 85,
  );
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldProject(
      isQRScan: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
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
                  const SizedBox(width: 8),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Информация",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const HeaderWidget(isNeedSettings: false),
              const SizedBox(height: 25),
              ListTile(
                contentPadding:EdgeInsets.zero,
                title: Row(
                  children: [
                    SvgPicture.asset("assets/icons/icon_izmena.svg"),
                    const SizedBox(width: 9),
                    const Expanded(child: Text('Изменить/добавить фотографию')),
                  ],
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showActionSheet(context),
              ),
              const SizedBox(height: 40),
              ListTile(
                contentPadding:EdgeInsets.zero,
                title: const Text('Пользовательское соглашение'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              ListTile(
                contentPadding:EdgeInsets.zero,
                title: const Text('Правовые документы'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              ListTile(
                contentPadding:EdgeInsets.zero,
                title: const Text('Обратная связь'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset("assets/icons/icon_vk.svg"),
                    onPressed: () {
                    },
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: SvgPicture.asset("assets/icons/icon_telegram.svg"),
                    onPressed: () {
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: ListTile(
                  contentPadding:EdgeInsets.zero,
                  title: const Text(
                    'Выйти из аккаунта',
                    style: TextStyle(
                      color: ColorProject.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) => const _Dialog(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showActionSheet(BuildContext context) {
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
