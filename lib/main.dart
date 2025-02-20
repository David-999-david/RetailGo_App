import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/core/configs/theme/app_theme.dart';
import 'package:retail/core/network/storage_utils.dart';
import 'package:retail/presentation/auth/notifier/signin_notifier.dart';
import 'package:retail/presentation/auth/signin.dart';

void main() async {
  await StorageUtils.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignInNotifier()),
      ],
      child: Main(),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: SignInPage(),
    );
  }
}
