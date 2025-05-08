import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/common/helper/app_navigation.dart';
import 'package:retail/data/cart/model/cart_model.dart';
import 'package:retail/presentation/cart/notifier/cart_list_notifier.dart';
import 'package:retail/presentation/cart/widgets/cart_item.dart';
import 'package:retail/presentation/confirm_order_screen/confirm_order_screen.dart';

class CartListPage extends StatelessWidget {
  const CartListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartListNotifier()..getAllCart(),
      child: Consumer<CartListNotifier>(
        builder: (context, notifier, child) {
          return Scaffold(
  appBar: cartAppBar(context),
  body: Column(
    children: [
      // 1) let the list take all available space
      Expanded(
        child: ListView.builder(
          itemCount: notifier.cartList.length,
          itemBuilder: (context, index) {
            final cart = notifier.cartList[index];
            return CartItemShow(cart: cart);
          },
        ),
      ),

      // 2) fixed footer
      Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            AppNavigator.push(context, ConfirmOrderScreen());
          },
          child: Text('Confirm Order'),
        ),
      ),
    ],
  ),
);

        },
      ),
    );
  }
}

AppBar cartAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () => AppNavigator.pop(context),
      icon: Icon(
        Icons.arrow_back_ios,
      ),
    ),
    title: Text("Cart"),
  );
}
