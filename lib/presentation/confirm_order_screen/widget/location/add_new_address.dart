import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/common/helper/app_navigation.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';

class AddNewAddress extends StatelessWidget {
  AddNewAddress({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ConfirmOrderNotifier>();
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Column(
          children: [
            Text(
              'ADD NEW ADDRESS',
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: provider.addressLine,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: 'Address Line',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Required'
                            : null),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: provider.city,
                            decoration: InputDecoration(
                                hintText: 'City',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            validator: (value) =>
                                (value == null || value.isEmpty)
                                    ? 'Required'
                                    : null,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: provider.state,
                            decoration: InputDecoration(
                                hintText: 'State',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            validator: (value) =>
                                (value == null || value.isEmpty)
                                    ? 'Required'
                                    : null,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: provider.country,
                            decoration: InputDecoration(
                                hintText: 'Country',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            validator: (value) =>
                                (value == null || value.isEmpty)
                                    ? 'Required'
                                    : null,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: provider.postalCode,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Postal Code',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Required';
                              if (int.tryParse(value) == null)
                                return 'Postal Code required number';
                              if (value.length <5)
                              return 'Postal code must be at least 5 digits';
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 2),
                            fixedSize: Size(360, 45),
                            side: BorderSide(
                                color: Color.fromARGB(255, 184, 184, 184)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.blue.shade600,
                            foregroundColor: Colors.white),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            provider.addNewAddress();
                            _formKey.currentState!.reset();
                            provider.addressLine.clear();
                            provider.city.clear();
                            provider.state.clear();
                            provider.country.clear();
                            provider.postalCode.clear();
                            AppNavigator.pop(context);
                          }
                        },
                        child: Text(
                          'Add Address',
                          style: TextStyle(fontSize: 16,),
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
