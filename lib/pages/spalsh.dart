import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/redux/thunk/account.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _checkAuth() async {
    await store.dispatch(init(context));
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
       await _checkAuth();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorProject.black,
      body: SafeArea(
        child: Container(
          color: ColorProject.black,
          child: Center(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Image.asset(
                    "assets/images/sloi.png",
                    width: 700,
                    height: 1000,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
