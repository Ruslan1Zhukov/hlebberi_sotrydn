import 'package:hlebberi_sotrydn/utils/parser.dart';

class QrLoginSuccess {
  final bool status;
  final String message;

  QrLoginSuccess({
    required this.status,
    required this.message,
  });

  static QrLoginSuccess fromJson(final Map<String, dynamic>? json) {
    if (json == null) {
      return QrLoginSuccess(
        status: false,
        message: "Нет ответа сервера",
      );
    }
    final status = json.getBoolOrNull('status') ?? false;
    final message = json.getStringOrNull("message") ?? "";
    return QrLoginSuccess(
      status: status,
      message: message,
    );
  }
}
