import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/salary.dart';
import 'package:hlebberi_sotrydn/redux/actions/slider.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/utils/date_time.dart';
import 'package:hlebberi_sotrydn/utils/month.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

/// Установить данные слайдера (зп, календарь) за месяц [month]
ThunkAction<AppState> setSliderData(int month) {
  return (Store<AppState> store) async {
    final dateRequest = month.toServer();
    final response = await ApiSalary.slider(date: dateRequest);
    if (response is ApiResponseError) {
      debugPrint("Ошмбка получения данных: ${response.error}");
      return;
    }
    final data = response.data;
    if (data == null) {
      debugPrint("Ошмбка получения данных: НЕТ ДАННЫХ");
      return;
    }
    await store.dispatch(SetSliderData(
      data: data,
      month: month,
    ));
  };
}

/// Установить данные за день детализированные
ThunkAction<AppState> setDayDetailedData(DateTime date) {
  return (Store<AppState> store) async {
    final response = await ApiSalary.dayDetail(date: date.toServer);
    if (response is ApiResponseError) {
      debugPrint("Ошмбка получения данных: ${response.error}");
      return;
    }
    final data = response.data;
    if (data == null) {
      debugPrint("Ошмбка получения данных: НЕТ ДАННЫХ");
      return;
    }
    await store.dispatch(SetDayDetailedData(
      data: data,
      date: date,
    ));
  };
}

/// Установить данные за день детализированные
ThunkAction<AppState> setMonthDetailedData(int  date) {
  return (Store<AppState> store) async {
    final response = await ApiSalary.monthDetail(date: date.toServer());
    if (response is ApiResponseError) {
      debugPrint("Ошмбка получения данных: ${response.error}");
      return;
    }
    final data = response.data;
    if (data == null) {
      debugPrint("Ошмбка получения данных: НЕТ ДАННЫХ");
      return;
    }
    await store.dispatch(SetMonthDetailedData(
      data: data,
      date: date,
    ));
  };
}

