import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/data/home/model/product_model.dart';
import 'package:retail/presentation/home/notifier/home_notifier.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.product,
      required this.isSelected,
      required this.isSelect,
      required this.index});

  final ProductModel product;
  final bool isSelected;
  final void Function(int index) isSelect;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context, provider, child) => Padding(
        padding: EdgeInsets.all(6),
        child: InkWell(
          onTap: () {
            isSelect(index);
            provider.getFilterProduct(context, product);
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                // border: Border.all(
                //     color: isSelected
                //         ? Colors.white
                //         : Color.fromARGB(255, 16, 111, 206)),
                borderRadius: BorderRadius.circular(10),
                color: isSelected
                    ? const Color.fromARGB(255, 40, 128, 244)
                    : Colors.grey[200]),
            child: Text(
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              product.categoryName,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: isSelected ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
