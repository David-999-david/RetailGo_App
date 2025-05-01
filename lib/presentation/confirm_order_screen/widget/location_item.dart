import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/data/address/model/address_model.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({super.key, required this.address});

  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    final readProvider = context.read<ConfirmOrderNotifier>();
    final selectedAddress =
        context.watch<ConfirmOrderNotifier>().selectedAddress;
    bool isSelected = selectedAddress?.addressId == address.addressId;
    return InkWell(
      onTap: () {
        readProvider.onSelectAddress(context,address);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        decoration: BoxDecoration(
            color: isSelected ? Colors.blue.shade600 : Colors.white,
            border: Border.all(color: Color.fromARGB(255, 184, 184, 184)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CircleAvatar(
                radius: 20,
                backgroundColor:
                    isSelected ? Colors.white : Colors.blue.shade600,
                foregroundColor:
                    isSelected ? Colors.blue.shade600 : Colors.white,
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
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '${address.city},${address.state},${address.country}',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.black),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Postal Code : ${address.postalCode}',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: isSelected ? Colors.white : Colors.black),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
