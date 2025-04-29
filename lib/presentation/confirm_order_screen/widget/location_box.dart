import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';

class LocationBox extends StatelessWidget {
  const LocationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConfirmOrderNotifier(),
      child: Consumer<ConfirmOrderNotifier>(
        builder: (context, provider, child) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
                border: Border.all(color: Color.fromARGB(255, 184, 184, 184)),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50),
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
                          '1456 St,Mandalay, ChanAyeTharSan',
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 22,
                      color: const Color.fromARGB(255, 184, 184, 184),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
