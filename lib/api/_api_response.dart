import 'package:flutter/material.dart';

abstract class ApiResponse<T> {
  makeResult({
    required Function(T data) onData,
    Function()? onError,
  }) {
    if (this is ApiResponseError) {
      final errorString = (this as ApiResponseError).error;
      debugPrint("Ошибка получения данных: $errorString");
    } else if (this is ApiResponseData<T>) {
      onData((this as ApiResponseData<T>).data);
    }
  }
}

class ApiResponseError<T> extends ApiResponse<T> {
  final String error;

  ApiResponseError({
    required this.error,
  });

  ApiResponseError.standard()
      : error = "Возникла ошибка\nОбратитесь к администратору";

  @override
  String toString() => "ApiResponseError($error)";
}

class ApiResponseData<T> extends ApiResponse<T> {
  final T data;

  ApiResponseData({
    required this.data,
  });

  @override
  String toString() => "ApiResponseData(${data.toString()})";
}
