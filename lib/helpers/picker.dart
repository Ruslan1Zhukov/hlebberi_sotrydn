import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/account.dart';
import 'package:hlebberi_sotrydn/helpers/auth.dart';
import 'package:hlebberi_sotrydn/redux/actions/account.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

/// Максимальный вес фото в МБ
const _maxWeight = 5;

Future<void> pickImage(ImageSource source) async {
  final image = await ImagePicker().pickImage(source: source);
  if (image == null) return;
  final croppedImage = await _crop(image);
  if (croppedImage == null) return;
  final compressedImage = await _compress(File(croppedImage.path));
  if (compressedImage == null) return;
  await _sendToServer(compressedImage);
}

Future<CroppedFile?> _crop(XFile image) async {
  return await ImageCropper().cropImage(
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
}

Future<File?> _compress(
  File imageFile, [
  int pass = 0,
]) async {
  final maxWeight =
      store.state.account.employeeAppSettings?.maxFileSize ?? _maxWeight;
  final int fileSize = await imageFile.length();
  if (fileSize < (maxWeight * 1024 * 1024)) return imageFile;
  final String targetPath = "${imageFile.path}_compressed_$pass.jpg";
  final XFile? xFile = await FlutterImageCompress.compressAndGetFile(
    imageFile.path,
    targetPath,
    format: CompressFormat.jpeg,
  );
  if (xFile == null) return null;
  final File compressedImage = File(xFile.path);
  var compressedImageSize = await compressedImage.length();
  if (compressedImageSize > (maxWeight * 1024 * 1024)) {
    return await _compress(compressedImage, pass + 1);
  } else {
    return compressedImage;
  }
}

Future _sendToServer(File compressImageResult) async {
  final response = await ApiAccount.avatar(avatar: compressImageResult);
  if (response is ApiResponseError) {
    debugPrint("Ошибка загрузки аватара: ${response.error}");
    return;
  }
  final avatarUrl = response.data;
  if (avatarUrl == null) {
    debugPrint("Ошибка загрузки аватара: НЕТ ДАННЫХ");
    return;
  }
  final savedLoginData = await getLoginData();
  if (savedLoginData == null) {
    debugPrint("Ошибка загрузки аватара: НЕТ СОХРАНЁННЫХ ДАННЫХ");
    return;
  }
  final changedLoginData = savedLoginData.copyWith(avatarUrl: avatarUrl);
  await store.dispatch(SetLoginData(loginData: changedLoginData));
  await saveLoginData(changedLoginData);
}
