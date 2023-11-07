import 'package:hlebberi_sotrydn/model/user.dart';

/// Состояние аккаунта
 class Account {
   /// Пользователь
   User? user;

   /// Авторизован ли пользователь
   bool userAuth = false;
 }