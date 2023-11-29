import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

/// Максимальный вес фото в МБ
const _maxWeight = 5;

Future<void> pickImage(BuildContext context) async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    final CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      cropStyle: CropStyle.circle,
      compressFormat: ImageCompressFormat.jpg,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Обрезать изображение',
          toolbarColor: ColorProject.orange,
          toolbarWidgetColor: ColorProject.black,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Обрезать изображение',
        ),
      ],
    );

    if (croppedImage != null) {
      var compressImageResult = await _compressImage(File(croppedImage.path), 0);
      if (compressImageResult == null) {
        debugPrint("Не получилось обработать изображение");
        return;
      }
      // вызваю функцию для загрузки фото на сервер
      // (для теста показываем экран с фото)
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => _ImageViewTestPage(imageFile: compressImageResult),
        ),
      );

    }
  }
}

Future<File?> _compressImage(File imageFile, int pass) async {
  final int fileSize = await imageFile.length();
  if (fileSize < (_maxWeight * 1024 * 1024)) return imageFile;
  final String targetPath = "${imageFile.path}_compressed_$pass.jpg";
  final XFile? xFile = await FlutterImageCompress.compressAndGetFile(
    imageFile.path,
    targetPath,
    format: CompressFormat.jpeg,
  );
  if (xFile == null) return null;
  final File compressedImage = File(xFile.path);
  var compressedImageSize = await compressedImage.length();
  if (compressedImageSize > (_maxWeight * 1024 * 1024)) {
    return await _compressImage(compressedImage, pass + 1);
  } else {
    return compressedImage;
  }
}

/// Для теста показать картинку
class _ImageViewTestPage extends StatelessWidget {
  final File imageFile;

  const _ImageViewTestPage({Key? key, required this.imageFile}) : super(key: key);

  String _getFileSizeInMB(File file) {
    final int bytes = file.lengthSync();
    return "${(bytes / (1024 * 1024)).toStringAsFixed(2)} Мб";
  }

  @override
  Widget build(BuildContext context) {
    final String fileSize = _getFileSizeInMB(imageFile);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Просмотр обработанного изображения'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Размер файла: $fileSize',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Image.file(imageFile),
          ],
        ),
      ),
    );
  }
}