import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/user.dart';

const double _size = 65;

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return FullScreenImageScreen(imageUrl: user.avatarUrl);
          },
        ));
      },
      child: Hero(
        tag: user.avatarUrl,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_size),
          child: Image.network(
            user.avatarUrl,
            fit: BoxFit.cover,
            width: _size,
            height: _size,
          ),
        ),
      ),
    );
  }
}

class FullScreenImageScreen extends StatelessWidget {
  const FullScreenImageScreen({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Hero(
                  tag: imageUrl,
                  child: GestureDetector(
                    onLongPress: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            content: const Text(
                                "Вы действительно хотите удалить фотографию? Отменить это действие невозможно."),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: const Text("Отмена",
                                    style: TextStyle(
                                        color: CupertinoColors.black)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              CupertinoDialogAction(
                                child: const Text("Удалить",
                                    style: TextStyle(
                                        color: CupertinoColors.systemRed)),
                                onPressed: () {
                                  CupertinoDialogAction(
                                    child: const Text("Удалить",
                                        style: TextStyle(
                                            color: CupertinoColors.systemRed)),
                                    onPressed: () async {
                                      // Здесь вы должны добавить код для удаления изображения
                                      try {
                                        // Пример: удаление изображения по URL (здесь необходимо заменить на вашу логику)
                                        // await MyImageStorageService.deleteImage(imageUrl);
                                        Navigator.of(context).pop();
                                      } catch (error) {
                                        print(
                                            "Ошибка при удалении изображения: $error");
                                      }
                                    },
                                  );
                                  Navigator.of(context)
                                      .pop(); // Закрыть диалоговое окно
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.network(imageUrl),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(CupertinoIcons.clear_circled),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
