import 'package:flutter/material.dart';
import 'package:retail/data/cart/model/cart_model.dart';
import 'package:retail/presentation/confirm_order_screen/widget/attribute_chip.dart';

class CartItemBox extends StatelessWidget {
  const CartItemBox({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.only(top: 5, bottom: 2),
      color: Colors.white,
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 13, right: 13, top: 10, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.network(
                item.imageUrl,
                width: 65,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        item.title,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                    ...item.attributes.map((attr) {
                      return AttributeChip(label: attr.name, value: attr.value);
                    }).toList()
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('\$${item.price.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 4,
                    ),
                    Text('Qty : ${item.quantity}',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
