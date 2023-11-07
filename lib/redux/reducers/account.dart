import 'package:hlebberi_sotrydn/redux/actions/account.dart';
import 'package:hlebberi_sotrydn/redux/state/account.dart';
import 'package:redux/redux.dart';

/// Редьюсер для аккаунта
final accountReducer = TypedReducer<Account, dynamic>(_accountReducer);

/// Обработчик для аккаунта
Account _accountReducer(Account state, action) {
  switch (action.runtimeType) {
    case SetUser:
      return _setUser(state, action);
    case SetUserAuth:
      return _setUserAuth(state, action);
  }
  return state;
}

/// Установить пользователя
Account _setUser(Account state, SetUser action) {
  state.user = action.user;
  return state;
}

/// Установить авторизацию пользователя
Account _setUserAuth(Account state, SetUserAuth action) {
  state.userAuth = action.userAuth;
  return state;
}

