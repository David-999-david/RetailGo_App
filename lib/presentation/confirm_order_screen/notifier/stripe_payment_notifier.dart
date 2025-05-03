import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:retail/domain/stripe/usecase/stripe_usecase.dart';

class StripePaymentNotifier extends ChangeNotifier {
  String? clientSecret;

  Future<bool> checkStripeData(double amount) async {
    try {
      final response = await StripeUsecase().getCleintSecret(amount);
      clientSecret = response.clientSecret;
      notifyListeners();

      return response.clientSecret.isNotEmpty;
    } catch (e) {
      debugPrint('Error when get client Secret : $e');
      return false;
    }
  }

  Future<bool> makePayment(double amount) async {
    final bool success = await checkStripeData(amount);

    if (!success || clientSecret == null) {
      debugPrint('Could not get clientSecret...');
      return false;
    }
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: clientSecret,
            merchantDisplayName: 'DaviD Shop'));
    await Stripe.instance.presentPaymentSheet();
    notifyListeners();
    return true;
    }
    on StripeException catch (e){
      debugPrint('Stripe exception : $e');
      return false;
    }
    catch (e) {
      debugPrint('Unknow error : $e');
      return false;
    }
  }
}
