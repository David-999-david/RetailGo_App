import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/domain/enums/address_enum.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';
import 'package:retail/presentation/confirm_order_screen/widget/location/add_new_address.dart';
import 'package:retail/presentation/confirm_order_screen/widget/location/saved_address.dart';

class ChooseDeliveryLocation extends StatelessWidget {
  const ChooseDeliveryLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConfirmOrderNotifier>();
    bool showAddressList = provider.activeOn == AddressEnum.fromSaved;
    return Scaffold(
      appBar: _appBar(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [
              SegmentedButton(
                multiSelectionEnabled: false,
                showSelectedIcon: false,
                direction: Axis.horizontal,
                onSelectionChanged: (newSelected) {
                  provider.onSelect(newSelected.first);
                  if (newSelected.first == AddressEnum.addNew) {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ChangeNotifierProvider.value(
                          value: provider,
                          child: AddNewAddress(),
                        );
                      },
                    );
                    provider.onSelect(AddressEnum.fromSaved);
                  }
                },
                segments: [
                  ButtonSegment(
                      value: AddressEnum.fromSaved,
                      label: Text(
                        'Saved Addresses',
                        style: TextStyle(fontSize: 16),
                      )),
                  ButtonSegment(
                      value: AddressEnum.addNew,
                      label: Text('Add New', style: TextStyle(fontSize: 16)))
                ],
                selected: {provider.activeOn},
                style: ButtonStyle(
                    shape: WidgetStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    backgroundColor: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.blue.shade600;
                      }
                      return Colors.white;
                    }),
                    foregroundColor: WidgetStateProperty.resolveWith(
                      (states) {
                        if (states.contains(WidgetState.selected)) {
                          return Colors.white;
                        }
                        return Colors.black87;
                      },
                    ),
                    fixedSize: WidgetStateProperty.all(Size(330, 55)),
                    padding: WidgetStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10))),
              ),
              SizedBox(
                height: 12,
              ),
              if (showAddressList) SavedAddress()
            ],
          ),
        ),
      ),
    );
  }
}

AppBar _appBar(BuildContext context) {
  return AppBar(
    title: Text(
      'Choose Delivery Location',
      style: TextStyle(fontSize: 25, color: Colors.black),
    ),
    centerTitle: true,
  );
}
