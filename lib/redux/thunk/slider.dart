import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/zp.dart';
import 'package:hlebberi_sotrydn/redux/actions/slider.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> setMonthData(int month) {
  return (Store<AppState> store) async {
    final now = DateTime.now();
    final yearString = now.year.toString();
    final monthString = month.toString().padLeft(2, "0");
    final dateRequest = "$yearString-$monthString";
    final response = await ApiZp.slider(date: dateRequest);
    if (response is ApiResponseError) {
      debugPrint("Ошмбка получения данных: ${response.error}");
      return;
    }
    final data = response.data;
    if (data == null) {
      debugPrint("Ошмбка получения данных: НЕТ ДАННЫХ");
      return;
    }
    store.dispatch(SetSliderData(
      data: data,
      month: month,
    ));
  };
}
