import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';

class AddNewAddress extends StatelessWidget {
  AddNewAddress({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ConfirmOrderNotifier>();
    return Padding(
      padding: EdgeInsets.all(10),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  controller: provider.addressLine,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Address Line',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black)),
                  validator: (value) =>
                      (value == null || value.isEmpty) ? 'Required' : null),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: provider.city,
                      decoration: InputDecoration(
                          hintText: 'City',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      validator: (value) =>
                          (value == null || value.isEmpty) ? 'Required' : null,
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
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      validator: (value) =>
                          (value == null || value.isEmpty) ? 'Required' : null,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: provider.country,
                      decoration: InputDecoration(
                          hintText: 'Country',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      validator: (value) =>
                          (value == null || value.isEmpty) ? 'Required' : null,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: provider.postalCode,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Postal Code',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      validator: (value) {
                        if  (value == null || value.isEmpty)return 'Required';
                        if (int.tryParse(value) == null)return 'Postal Code required number';
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(360, 60),
                      side:
                          BorderSide(color: Color.fromARGB(255, 184, 184, 184)),
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
                    }
                  },
                  child: Text(
                    'Add Address',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          )),
    );
  }
}
