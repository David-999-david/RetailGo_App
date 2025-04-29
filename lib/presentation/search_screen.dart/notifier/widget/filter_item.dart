import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({super.key, required this.item});

  final String item;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(item, style: TextStyle(color: Colors.black)),
    );
  }
}
