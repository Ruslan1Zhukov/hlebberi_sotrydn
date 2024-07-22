// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/account.dart';
import 'package:hlebberi_sotrydn/helpers/auth.dart';
import 'package:hlebberi_sotrydn/helpers/info.dart';
import 'package:hlebberi_sotrydn/helpers/toast.dart';
import 'package:hlebberi_sotrydn/model/login_data.dart';
import 'package:hlebberi_sotrydn/redux/actions/account.dart';
import 'package:hlebberi_sotrydn/redux/actions/slider.dart';
import 'package:hlebberi_sotrydn/redux/actions/smena.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> init(BuildContext context) {
  return (Store<AppState> store) async {
    final loginDataSaved = await getLoginData();
    if (loginDataSaved == null) {
      _toLogin(context);
      return;
    }
    await _saveLoginData(loginDataSaved);
    final response = await ApiAccount.checkAuth();
    if (response is ApiResponseData) {
      final infoSaved = await getInfoData();
      if (infoSaved == false){
        _toInfo(context);
        return;
      }
      await _saveLoginData((response as ApiResponseData<LoginData>).data);
      _toHome(context);
    } else if (response is ApiResponseError) {
      toast(context, (response as ApiResponseError).error);
      await _saveLoginData(null);
      _toLogin(context);
    }
  };
}

ThunkAction<AppState> login({
  required BuildContext context,
  required String login,
  required String password,
}) {
  return (Store<AppState> store) async {
    final response = await ApiAccount.login(login: login, password: password);
    if (response is ApiResponseData) {
      await _saveLoginData((response as ApiResponseData<LoginData>).data);
      _toSplash(context);
    } else if (response is ApiResponseError) {
      toast(context, (response as ApiResponseError).error);
      await _saveLoginData(null);
      _toLogin(context);
    }
  };
}

ThunkAction<AppState> logout(BuildContext context) {
  return (Store<AppState> store) async {
    await _saveLoginData(null);
    await store.dispatch(ClearSlider());
    await store.dispatch(ClearSmena());
    _toSplash(context);
  };
}

Future _saveLoginData(LoginData? loginData) async {
  await store.dispatch(SetLoginData(loginData: loginData));
  await saveLoginData(loginData);
}

_toLogin(BuildContext context) => _toNavigate(context, '/login');

_toHome(BuildContext context) => _toNavigate(context, '/home');

_toSplash(BuildContext context) => _toNavigate(context, '/');

_toInfo(BuildContext context) => _toNavigate(context, '/info');

_toNavigate(BuildContext context, String key) =>
    Navigator.pushNamedAndRemoveUntil(
      context,
      key,
      (Route<dynamic> route) => false,
    );