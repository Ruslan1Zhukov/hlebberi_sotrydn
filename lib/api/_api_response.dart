import 'package:flutter/notifications.dart';

class ApiResponse<T> {
  final T? response;
  final String? error;

  ApiResponse({
    this.response,
    this.error,
  });

  printError() {
    showToast(error, isError: true);
  }
}

class ApiResponseError<T> extends ApiResponse<T> {
  @override
  String get error {
    return super.error ?? "";
  }

  ApiResponseError({
    required super.error,
  }) : super(response: null);

  ApiResponseError.standard()
      : super(error: "Возникла ошибка\nОбратитесь к администратору");
}

class ApiResponseData<T> extends ApiResponse<T> {
  @override
  T get response {
    var response = super.response;
    if (response == null) throw Exception();
    return response;
  }

  ApiResponseData({
    required super.response,
  });
}