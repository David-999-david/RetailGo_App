import 'package:flutter/material.dart';
import 'package:retail/presentation/auth/login.dart';
import 'package:retail/presentation/auth/register.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        body: LoginPage(),
      ),
    );
  }
}