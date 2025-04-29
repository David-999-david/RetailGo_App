import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/data/cart/model/cart_model.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';

class CartItemsBox extends StatelessWidget {
  const CartItemsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConfirmOrderNotifier()..getAllcartList(),
      child: Consumer<ConfirmOrderNotifier>(
        builder: (context, provider, child) {
          return Container(
              width: double.infinity,
              height: 330,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color.fromARGB(255, 184, 184, 184)),
                  borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 17, right: 17, top: 5),
                      child: _cartItemsTable(context, provider),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}

Table _cartItemsTable(BuildContext context, ConfirmOrderNotifier provider) {
  return Table(
    columnWidths: {
      0: FlexColumnWidth(1),
      1: FlexColumnWidth(2),
      2: FlexColumnWidth(1)
    },
    children: [
      for (var cartitem in provider.cartList)
        _cartItemsTableRow(cartitem,
            showBottomBorder: cartitem != provider.cartList.last)
    ],
  );
}

TableRow _cartItemsTableRow(CartModel cartItem,
    {required bool showBottomBorder}) {
  return TableRow(
      decoration: showBottomBorder
          ? BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1)))
          : null,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12, top: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              cartItem.featuredImage,
              width: 50,
              height: 80,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 20, top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cartItem.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                'Qty : ${cartItem.qty}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            '\$${double.parse(cartItem.basePrice).toStringAsFixed(2)}',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        )
      ]);
}
