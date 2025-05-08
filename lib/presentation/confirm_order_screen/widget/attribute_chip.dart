import 'package:flutter/material.dart';

class AttributeChip extends StatelessWidget {
  const AttributeChip({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('${label.toUpperCase()} : ${value.toUpperCase()}'),
      labelStyle: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.black),
      labelPadding: EdgeInsets.zero,
      side: BorderSide(
        color: Colors.grey.shade200
      ),
      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 4),
      backgroundColor: Colors.grey.shade200,
      visualDensity: VisualDensity.compact,
    );
  }
}
