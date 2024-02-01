import 'package:hlebberi_sotrydn/redux/actions/account.dart';
import 'package:hlebberi_sotrydn/redux/state/account.dart';
import 'package:redux/redux.dart';

/// Редьюсер для аккаунта
final accountReducer = TypedReducer<Account, dynamic>(_accountReducer);

/// Обработчик для аккаунта
Account _accountReducer(Account state, action) {
  switch (action.runtimeType) {
    case SetLoginData:
      return _setLoginData(state, action);
  }
  return state;
}

Account _setLoginData(Account state, SetLoginData action) {
  state.user = action.loginData?.user;
  state.token = action.loginData?.token;
  state.employeeAppSettings = action.loginData?.employeeAppSettings;
  state.employeeExternalLinks = action.loginData?.employeeExternalLinks;
  state.employeeSocialLinks = action.loginData?.employeeSocialLinks;
  return state;
}

