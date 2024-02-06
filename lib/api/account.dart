import 'dart:convert';
import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/_client_dio.dart';
import 'package:hlebberi_sotrydn/model/response/login_data.dart';

abstract class ApiAccount {
  static Future<ApiResponse<LoginData>> login({
    required String login,
    required String password,
  }) async {
    final data = {
      "email": login,
      "password": password,
      "type": "employee",
    };
    final json = jsonEncode(data);
    final response = await ClientDio.post(
      url: "/auth/login",
      requestBody: json,
    );
    return ClientDio.makeResult(
      response: response,
      converter: (response) => LoginData.fromJson(response.data["data"]),
    );
  }

  static Future<ApiResponse<LoginData>> checkAuth() async {
    // TODO: проверить выполнение метода
    final response = await ClientDio.get(
      url: "/auth/user",
    );
    return ClientDio.makeResult(
      response: response,
      converter: (response) => LoginData.fromJson(response.data["data"]),
    );
  }

  static Future<ApiResponse<void>> logout() async {
    final response = await ClientDio.post(
      url: "/auth/logout",
    );
    return ClientDio.makeResult(response: response, converter: (response) {});
  }

  static Future<ApiResponse<void>> avatar({
    required String userId,
    required String addressCode1c,
  }) async {
    final response = await ClientDio.post(
      url: "/users/{userId}/upload-avatar",
      parameters: {
        "userId": userId,
        "address_code_1c": addressCode1c,
      },
    );
    return ClientDio.makeResult(response: response, converter: (response) {});
  }
}
