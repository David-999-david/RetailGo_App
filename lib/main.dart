import 'package:flutter/material.dart';
import 'package:retail/core/configs/theme/app_theme.dart';
import 'package:retail/core/network/storage_utils.dart';
import 'package:retail/presentation/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtils.getInstance();
  runApp(
    Main(),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: HomePage(),
    );
  }
}
