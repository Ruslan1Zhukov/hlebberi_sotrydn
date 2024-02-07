import 'dart:convert';

import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/_client_dio.dart';
import 'package:hlebberi_sotrydn/model/response/token_qr.dart';

abstract class ApiQR {
  static Future<ApiResponse<TokenQR>> login({
    required String hash,
    required int userId,
  }) async {
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
      converter: (response) => TokenQR.fromJson(
        response.data["data"]["shift_access_token"],
      ),
    );
  }
}
