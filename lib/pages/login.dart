import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/redux/thunk/account.dart';
import 'package:hlebberi_sotrydn/theme/buttons.dart';
import 'package:hlebberi_sotrydn/theme/fields.dart';
import 'package:hlebberi_sotrydn/theme/scaffold.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controllerLogin = TextEditingController();
  final _controllerPassword = TextEditingController();

  bool isLoading = false;

  _onTapButton() async {
    setState(() {
      isLoading = true;
    });
    var textLogin = _controllerLogin.text;
    var textPassword = _controllerPassword.text;
    if (textLogin.isEmpty) {
      _snack("Введите логин");
      setState(() {
        isLoading = false;
      });
      return;
    }
    if (textPassword.isEmpty) {
      _snack("Введите пароль");
      setState(() {
        isLoading = false;
      });
      return;
    }
    await store.dispatch(login(
      context: context,
      login: textLogin,
      password: textPassword,
    ));
    setState(() {
      isLoading = false;
    });
  }

  _snack(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
    ));
  }

  @override
  void dispose() {
    _controllerLogin.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldProject(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTitle(),
                const SizedBox(height: 33),
                buildLoginField(),
                const SizedBox(height: 15),
                buildPasswordField(),
                const SizedBox(height: 24),
                buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return const Text(
      "Авторизация",
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    );
  }

  Widget buildLoginField() {
    return CustomTextFormField(
      hint: "Введите логин",
      controller: _controllerLogin,
      label: ' Логин',
    );
  }

  Widget buildPasswordField() {
    return CustomTextFormField(
      obscureText: true,
      hint: " Введите пароль",
      controller: _controllerPassword,
      label: ' Пароль',
    );
  }

  Widget buildButton() {
    return CustomButton(
      isLoading: isLoading,
      onTap: _onTapButton,
      label: "Войти",
    );
  }
}