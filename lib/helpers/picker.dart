import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

///Максимальный вес фото в МБ
const _maxWeight = 5;

Future<void> pickImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    final CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 100,
      maxWidth: 300,
      maxHeight: 300,
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
      await compressImageIfNeeded(croppedImage);
    }
  }
}

Future<void> compressImageIfNeeded(CroppedFile croppedImage) async {
  final File imageFile = File(croppedImage.path);
  final int fileSize = await imageFile.length();

  if (fileSize > (_maxWeight * 1024 * 1024)) {
    final String targetPath = "${croppedImage.path}_compressed.jpg";
    final File? compressedImage =
        (await FlutterImageCompress.compressAndGetFile(
      croppedImage.path,
      targetPath,
      quality: 85,
    )) as File?;
    if (compressedImage != null) {}
  }
}
