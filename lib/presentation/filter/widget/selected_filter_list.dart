import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/filter/notifier/filter_category_notifier.dart';

class SelectedFilterList extends StatelessWidget {
  const SelectedFilterList({super.key, required this.selectedValue});

  final String selectedValue;

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterCategoryNotifier>(
      builder: (context, provider, child) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue.withOpacity(0.2),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selectedValue,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue),
                ),
                GestureDetector(
                  onTap: () {
                    provider.removeSubFilter(selectedValue);
                  },
                  child: Icon(
                    Icons.clear,
                    size: 15,
                    color: Colors.red.withOpacity(0.8),
                  ),
                )
              ],
            ));
      },
    );
  }
}
