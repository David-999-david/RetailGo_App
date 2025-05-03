import 'package:flutter/material.dart';
import 'package:retail/core/configs/theme/app_theme.dart';
import 'package:retail/core/network/storage_utils.dart';
import 'package:retail/presentation/active_screen/active_screen.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtils.getInstance();
  Stripe.publishableKey = 'pk_test_51RI0FERnFcSp5ud5btlcO4Aqid8E9IJup0Dmxm7L1YbrOZvPmyzv5W8zGbeoqyN55H0Pe1oiZBJH9IJf38hxBdB800sZFStbq2';
   await Stripe.instance.applySettings();
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: ActiveScreen(),
    );
  }
}
