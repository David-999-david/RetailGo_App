import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/core/configs/theme/app_colors.dart';
import 'package:retail/presentation/auth/notifier/signin_notifier.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInNotifier readNotifier = context.read<SignInNotifier>();
    final SignInNotifier watchNotifier = context.watch<SignInNotifier>();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _emailTextField(readNotifier),
                _spacing(),
                _pswTextField(readNotifier, watchNotifier),
                _forgotPsw(),
                _spacing(),
                _login(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailTextField(SignInNotifier readNotifier) {
    return TextFormField(
      controller: readNotifier.emailCtr,
      decoration: InputDecoration(labelText: 'Email'),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _pswTextField(
      SignInNotifier readNotifier, SignInNotifier watchNotifier) {
    return TextField(
      controller: readNotifier.pswCtr,
      decoration: InputDecoration(
        labelText: 'Password',
        suffix: GestureDetector(
          onTap: () => readNotifier.changeVisibility(),
          child: Icon(
            watchNotifier.isVisibility
                ? Icons.visibility
                : Icons.visibility_off,
            color: AppColors.primary,
          ),
        ),
      ),
      obscureText: readNotifier.isVisibility,
      keyboardType: TextInputType.number,
    );
  }

  Widget _forgotPsw() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'Forgot Password',
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Colors.blue, decoration: TextDecoration.underline),
        ),
      ),
    );
  }

  Widget _login() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.buttonBackground,
        ),
        child: Center(
          child: Text(
            "Login", 
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }

  Widget _spacing() {
    return SizedBox(
      height: 15,
    );
  }
}
