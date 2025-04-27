import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/core/configs/theme/app_theme.dart';
import 'package:retail/core/network/storage_utils.dart';
import 'package:retail/presentation/active_screen/active_screen.dart';
import 'package:retail/presentation/filter/notifier/filter_category_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtils.getInstance();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FilterCategoryNotifier())
    ],
    child: Main(),
  ));
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
