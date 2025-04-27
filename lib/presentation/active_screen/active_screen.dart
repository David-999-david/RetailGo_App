import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/active_screen/notifier/active_screen_provider.dart';
import 'package:retail/presentation/home/home_screen.dart';
import 'package:retail/presentation/order/order_screen.dart';
import 'package:retail/presentation/search_screen.dart/search_screen.dart';

class ActiveScreen extends StatelessWidget{
  const ActiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screenList = [
      HomeScreen(),
      SearchScreen(allFilterList: []),
      OrderScreen(),
    ];
  return ChangeNotifierProvider(create: (context)=> ActiveScreenProvider(),
  child: Consumer<ActiveScreenProvider>(builder: (context, provider, child) {
    return Scaffold(
      body: screenList[provider.currentIndex],
      bottomNavigationBar: NavigationBar(
        height: 55,
        onDestinationSelected: (index) {
          provider.activePageIndex(index);
        } ,
        destinations: [
          NavigationDestination(icon: Icon(Icons.house), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search_rounded), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.receipt_long), label: 'Order')
        ]),
    );
  },),);   
  }
}

