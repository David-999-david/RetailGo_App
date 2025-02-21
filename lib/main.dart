import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/auth/signin.dart';
import 'package:retail/presentation/onboard/notifier/onboard_notifier.dart';
import 'package:retail/presentation/onboard/onboard.dart';
import 'package:retail/presentation/onboard/service/onboard_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //from isonboardcompled => prefs will get first bool false;
  bool isonBoardCompled = await OnboardService.isonBoardCompled();
  runApp(MyApp(isonBoardCompled: isonBoardCompled));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isonBoardCompled});

  final bool isonBoardCompled;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => OnboardNotifier())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //first isonboardcompled is false => onboardscreen will show, after setonboardcompleted is done,
        //the initial route will directly => signin or another;
        initialRoute: isonBoardCompled ? '/auth' : '/',
        routes: {
          '/': (context) => OnboardScreen(),
          '/auth': (context) => Signin()
        },
      ),
    );
  }
}
