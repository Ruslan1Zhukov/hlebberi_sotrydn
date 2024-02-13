import 'dart:convert';

import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/_client_dio.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';

abstract class ApiQR {
  static Future<ApiResponse<bool>> login({
    required String hash,
  }) async {
    final userId = store.state.account.user?.id;
    if (userId == null) return ApiResponseError(error: "Не найден userId");
    final data = {
      "hash": hash,
      "user_id": userId,
    };
    final json = jsonEncode(data);
    final response = await ClientDio.post(
      url: "/auth/qr",
      requestBody: json,
    );
    return ClientDio.makeResult(
      response: response,
      converter: (response) => true,
    );
  }
}
