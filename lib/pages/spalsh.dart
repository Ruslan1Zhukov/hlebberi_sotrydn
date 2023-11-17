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
                    "assets/images/sloi1x4.png",
                    width: 180.84,
                    height: 208.9,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/sloi_2.png",
                    width: 195,
                    height: 118,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/sloi3.png",
                    width: 181.32,
                    height: 142.36,
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
