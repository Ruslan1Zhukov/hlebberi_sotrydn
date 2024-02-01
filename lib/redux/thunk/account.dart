// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/account.dart';
import 'package:hlebberi_sotrydn/helpers/auth.dart';
import 'package:hlebberi_sotrydn/helpers/toast.dart';
import 'package:hlebberi_sotrydn/redux/actions/account.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> init(BuildContext context) {
  return (Store<AppState> store) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final loginDataSaved = await getLoginData();
    if (loginDataSaved != null) {
      final response = await ApiAccount.checkAuth();
      if (response is ApiResponseData) {
        final loginDataServer = response.response;
        if (loginDataServer == null) {
          toast(context, "Данные с сервера не пришли");
          await saveLoginData(null);
          Navigator.pushReplacementNamed(context, '/login');
          return;
        }
        await store.dispatch(SetLoginData(loginData: loginDataServer));
        await saveLoginData(loginDataServer);
        Navigator.pushReplacementNamed(context, '/home');
        return;
      }
      toast(context, response.error);
      await saveLoginData(null);
      Navigator.pushReplacementNamed(context, '/login');
      return;
    }
    Navigator.pushReplacementNamed(context, '/login');
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
      final loginData = response.response;
      if (loginData == null) {
        toast(context, "Данные с сервера не пришли");
        return;
      }
      await store.dispatch(SetLoginData(loginData: loginData));
      await saveLoginData(loginData);
      Navigator.pushReplacementNamed(context, '/home');
      return;
    }
    toast(context, response.error);
  };
}

ThunkAction<AppState> logout(BuildContext context) {
  return (Store<AppState> store) async {
    // await setAuth(false);
    Navigator.pushReplacementNamed(context, '/');
  };
}