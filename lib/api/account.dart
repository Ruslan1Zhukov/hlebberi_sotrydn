import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/_client_dio.dart';
import 'package:hlebberi_sotrydn/model/login_data.dart';

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
      converter: (response) => LoginData.fromJson(response.data["data"])!,
    );
  }

  static Future<ApiResponse<LoginData>> checkAuth() async {
    final response = await ClientDio.get(
      url: "/auth/user",
    );
    return ClientDio.makeResult(
      response: response,
      converter: (response) => LoginData.fromJson(response.data["data"], true)!,
    );
  }

  static Future<ApiResponse<void>> logout() async {
    final response = await ClientDio.post(
      url: "/auth/logout",
    );
    return ClientDio.makeResult(response: response, converter: (response) {});
  }

  static Future<ApiResponse<String>> avatar({
    required File avatar,
  }) async {
    String fileName = avatar.path.split('/').last;
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        avatar.path,
        filename: fileName,
      ),
    });
    final response = await ClientDio.post(
      url: "/employee/upload-avatar",
      requestBody: formData,
    );
    return ClientDio.makeResult(
      response: response,
      converter: (response) => response.data['data']['avatar'],
    );
  }

  static Future<ApiResponse<bool>> deleteAvatar() async {
    final response = await ClientDio.post(
      url: "/employee/delete-avatar",
    );
    return ClientDio.makeResult(
      response: response,
      converter: (response) => true,
    );
  }
}
