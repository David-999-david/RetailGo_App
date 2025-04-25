import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/data/home/model/product_model.dart';
import 'package:retail/presentation/home/notifier/home_notifier.dart';

class SecondaryCategoryCard extends StatelessWidget {
  const SecondaryCategoryCard(
      {super.key,
      required this.product,
      required this.isSelected,
      required this.isSelect,
      required this.index});

  final ProductModel product;
  final bool isSelected;
  final void Function(int) isSelect;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context, provider, child) => InkWell(
        onTap: () {
          isSelect(index);
          provider.filterSubProduct(product);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color:
                isSelected ? Color.fromARGB(255, 40, 128, 244) : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
              child: Text(
            product.subCategoryName,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: isSelected
                    ? Colors.white
                    : Color.fromARGB(255, 95, 68, 68)),
          )),
        ),
      ),
    );
  }
}
