import 'dart:convert';

import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/_client_dio.dart';
import 'package:hlebberi_sotrydn/model/response/qr_data.dart';

abstract class ApiAccount {
  static Future<ApiResponse<ShiftAccessToken>> login({
    required String hash,
    required int user_id,
  }) async {
    final data = {
      "hash": hash,
      "user_id": user_id,
    };
    final json = jsonEncode(data);
    final response = await ClientDio.post(
      url: "/auth/qr",
      requestBody: json,
    );
    return ClientDio.makeResult(
      response: response,
      converter: (response) => ShiftAccessToken.fromJson(response.data["data"]),
    );
  }
}