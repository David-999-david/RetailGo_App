import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/common/helper/app_navigation.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';
import 'package:retail/presentation/confirm_order_screen/widget/location/choose_delivery_location.dart';

class LocationBox extends StatelessWidget {
  const LocationBox({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConfirmOrderNotifier>();
    final deliveryAddress = provider.selectedAddress;
    final list = provider.addressList;
    return InkWell(
      splashColor: Colors.grey.shade100,
      onTap:() {
                final provider = context.read<ConfirmOrderNotifier>();
                AppNavigator.push(
                    context,
                    ChangeNotifierProvider.value(
                      value: provider,
                      child: ChooseDeliveryLocation(),
                    ));
              },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
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
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deliver to',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    if (deliveryAddress != null)
                         Text(
                            '${deliveryAddress.addressLine},${deliveryAddress.city},${deliveryAddress.state},${deliveryAddress.country}',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis),
                          )
                          else if (list.isNotEmpty)
                         Text(
                            '${list.first.addressLine},${list.first.city},${list.first.state},${list.first.country},${list.first.postalCode}',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis),
                          )
                          else 
                          Text(
                            'No saved Address, Added one.'
                            ,style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis),)
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
      ),
    );
  }
}
