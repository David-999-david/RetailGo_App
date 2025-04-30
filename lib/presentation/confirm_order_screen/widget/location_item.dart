import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/data/address/model/address_model.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({super.key, required this.address});

  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConfirmOrderNotifier(),
      child: Consumer(
        builder: (context, value, child) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color.fromARGB(255, 184, 184, 184)),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue.shade600,
                    foregroundColor: Colors.white,
                    child: Icon(Icons.location_on),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      address.addressLine,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      '${address.city},${address.state},${address.country}',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Postal Code : ${address.postalCode}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
