import 'package:hlebberi_sotrydn/model/user.dart';

/// Установить пользователя
class SetUser {
  ///Пользователь
  final User? user;

  SetUser({
    required this.user,
  });
}

/// Установить авторизацию пользователя
class SetUserAuth {
  /// Авторизован ли пользователь
  final bool userAuth;

  SetUserAuth({
    required this.userAuth,
  });
}
