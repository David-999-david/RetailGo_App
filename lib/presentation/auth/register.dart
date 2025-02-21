import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/core/configs/theme/app_colors.dart';
import 'package:retail/presentation/auth/notifier/register_notifier.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

   

  @override
  Widget build(BuildContext context) {
    final RegisterNotifier readNotifier = context.read<RegisterNotifier>();
    final RegisterNotifier watchNotifier = context.watch<RegisterNotifier>();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                fullNameTextField(readNotifier),
                _spacer(),
                emailTextField(readNotifier),
                _spacer(),
                passwordField(readNotifier, watchNotifier),
                _spacer(),
                phoneTextField(readNotifier),
                _spacer(),
                addressTextField(readNotifier),
                _spacer(),
                register()
              ],
            ),
          ),

        ),
      ),
    );
  }

  Widget fullNameTextField(RegisterNotifier readNotifier) {
    return TextFormField(
      controller: readNotifier.fullNameCtr,
      decoration: InputDecoration(labelText: 'Full Name'),
      keyboardType: TextInputType.name,
    );
  }

  
  Widget emailTextField(RegisterNotifier readNotifier) {
    return TextFormField(
      controller: readNotifier.emailCtr,
      decoration: InputDecoration(
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget passwordField(
      RegisterNotifier readNotifier, RegisterNotifier watchNotifier) {
    return TextFormField(
      controller: readNotifier.passwordCtr,
      decoration: InputDecoration(
          labelText: 'Password',
          suffix: GestureDetector(
              onTap: () => watchNotifier.changeVisibility(),
              child: Icon(
                watchNotifier.isVisibility
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: AppColors.primary,
              ))),
      obscureText: readNotifier.isVisibility,
      keyboardType: TextInputType.number,
    );
  }

  Widget phoneTextField(RegisterNotifier readNotifier) {
    return TextFormField(
      controller: readNotifier.phoneCtr,
      decoration: InputDecoration(labelText: 'Phone'),
      keyboardType: TextInputType.number,
    );
  }


  Widget addressTextField(RegisterNotifier readNotifier) {
    return TextFormField(
      controller: readNotifier.addressCtr,
      decoration: InputDecoration(labelText: 'Address'),
      keyboardType: TextInputType.streetAddress,
    );
  }

  Widget register() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.buttonBackground),
        child: Center(
          child: Text('Register'),
        ),
      ),
    );
  }

  
  Widget _spacer() {
    return SizedBox(
      height: 15,
    );
  }
}
