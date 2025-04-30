import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return ChangeNotifierProvider(
      create: (context) => ConfirmOrderNotifier(),
      child: Consumer<ConfirmOrderNotifier>(
        builder: (context, provider, child) {
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
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Required'
                            : null),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: provider.city,
                      decoration: InputDecoration(
                          hintText: 'City',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      validator: (value) =>
                          (value == null || value.isEmpty) ? 'Required' : null,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: provider.state,
                      decoration: InputDecoration(
                          hintText: 'State',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      validator: (value) =>
                          (value == null || value.isEmpty) ? 'Required' : null,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: provider.country,
                      decoration: InputDecoration(
                          hintText: 'Country',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      validator: (value) =>
                          (value == null || value.isEmpty) ? 'Required' : null,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: provider.postalCode,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Postal Code',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(360, 60),
                            side: BorderSide(
                                color: Color.fromARGB(255, 184, 184, 184)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.blue.shade600,
                            foregroundColor: Colors.white),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            provider.addNewAddress();
                          }
                        },
                        child: Text(
                          'Add Address',
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                )),
          );
        },
      ),
    );
  }
}
