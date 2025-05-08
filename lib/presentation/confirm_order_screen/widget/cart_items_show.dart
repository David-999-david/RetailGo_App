import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';
import 'package:retail/presentation/confirm_order_screen/widget/cart_item_box.dart';

class CartItemsShow extends StatelessWidget{
  const CartItemsShow({super.key});

  @override
  Widget build(BuildContext context) {
  final provider = context.watch<ConfirmOrderNotifier>();    
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return CartItemBox(item: provider.cartList[index]);
    }, 
    // separatorBuilder: (context, index) {
    //   return SizedBox(height: 1,);
    // }, 
    itemCount: provider.cartList.length);
  }
}