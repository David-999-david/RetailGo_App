import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/common/helper/app_navigation.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';
import 'package:retail/presentation/confirm_order_screen/widget/choose_delivery_location.dart';

class LocationBox extends StatelessWidget {
  const LocationBox({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConfirmOrderNotifier>();
    final deliveryAddress = provider.selectedddress;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color.fromARGB(255, 184, 184, 184)),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue.shade600,
            foregroundColor: Colors.white,
            child: Icon(Icons.location_on),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deliver to',
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '${deliveryAddress!.addressLine},${deliveryAddress!.city},${deliveryAddress!.state},${deliveryAddress!.country}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                final provider = context.read<ConfirmOrderNotifier>();
                AppNavigator.push(
                    context,
                    ChangeNotifierProvider.value(
                      value: provider,
                      child: ChooseDeliveryLocation(),
                    ));
              },
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 22,
                color: const Color.fromARGB(255, 184, 184, 184),
              ))
        ],
      ),
    );
  }
}
