import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';
import 'package:retail/presentation/confirm_order_screen/widget/location/location_item.dart';

class SavedAddress extends StatelessWidget {
  const SavedAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConfirmOrderNotifier>();
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return LocationItem(address: provider.addressList[index],);
          }, 
          separatorBuilder: (context, index) {
            return SizedBox(height: 10,);
          }, 
          itemCount: provider.addressList.length),
      ),
    );
  }
}
