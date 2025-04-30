import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';

class LocationItem extends StatelessWidget{
  const LocationItem({super.key});

  @override
  Widget build(BuildContext context) {
  return ChangeNotifierProvider(create: (context) => ConfirmOrderNotifier(),
  child: Consumer(builder: (context, value, child) {
    return Container();
  },),
  );    
  }
}