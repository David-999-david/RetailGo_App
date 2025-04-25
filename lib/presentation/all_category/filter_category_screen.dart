import 'package:flutter/material.dart';
import 'package:retail/common/helper/app_navigation.dart';
import 'package:retail/presentation/home/widgets/circular_action_button.dart';

class FilterCategoryScreen extends StatelessWidget {
  const FilterCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
    );
  }
}

AppBar _appBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularActionButton(
            onTap: () => AppNavigator.pop(context),
            hSize: 30,
            wSize: 30,
            child: Icon(
              Icons.arrow_back_ios,
              size: 23,
            ))
      ],
    ),
  );
}
