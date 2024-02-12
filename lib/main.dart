import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hlebberi_sotrydn/pages/home.dart';
import 'package:hlebberi_sotrydn/pages/login.dart';
import 'package:hlebberi_sotrydn/pages/spalsh.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ru')],
        routes: {
          '/': (_) => const SplashPage(),
          '/login': (_) => const LoginPage(),
          '/home': (_) => const HomePage(),
        },
      ),
    );
  }
}
