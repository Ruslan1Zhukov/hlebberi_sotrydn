// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/helpers/auth.dart';
import 'package:hlebberi_sotrydn/model/user.dart';
import 'package:hlebberi_sotrydn/redux/actions/account.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/test_data.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> init(BuildContext context) {
  return (Store<AppState> store) async {
    bool auth = await gatAuth();
    store.dispatch(SetUserAuth(userAuth: auth));
    await Future.delayed(const Duration(milliseconds: 300));
    if (auth) {
      User user = testUser;
      await store.dispatch(SetUser(user: user));
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  };
}

ThunkAction<AppState> login({
  required BuildContext context,
  required String login,
  required String password,
}) {
  return (Store<AppState> store) async {
    if (login == "login" && password == "1234") {
      await setAuth(true);
      Navigator.pushReplacementNamed(context, '/');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Неверный логин или пароль"),
      ));
    }
  };
}

ThunkAction<AppState> logout(BuildContext context) {
  return (Store<AppState> store) async {
    await setAuth(false);
    Navigator.pushReplacementNamed(context, '/');
  };
}