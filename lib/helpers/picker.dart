import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

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
      // вычислить размер обрезанного фото
      // если размер больше 5 мб, то сжать
    }
  }
}

// Future<XFile?> _compressFile(File file) async {
//   final filePath = file.absolute.path;
//   final lastIndex = filePath.lastIndexOf(RegExp(r'\.(jpg|jpeg|png)'));
//   final outPath = "${filePath.substring(0, lastIndex)}_compressed.jpg";
//
//   return await FlutterImageCompress.compressAndGetFile(
//     filePath,
//     outPath,
//     quality: 85,
//   );
// }