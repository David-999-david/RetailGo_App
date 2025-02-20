import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _password,
                decoration: InputDecoration(
                  labelText: 'Password', 
                  border: OutlineInputBorder()
                ),
                obscureText: true,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  TextButton(onPressed: () {}, child: Text('forgot password')),
                ],
              ),
              SizedBox(
                height: 5,
              ),

              ElevatedButton(
                onPressed: () {}, 
                child: Text('Login')
              )
            ],
          ),
        ),
      ),
    );
  }
}
