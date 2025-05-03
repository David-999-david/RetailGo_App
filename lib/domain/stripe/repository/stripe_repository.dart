import 'package:retail/data/stripe/model/stripe_model.dart';
import 'package:retail/data/stripe/remote/stripe_remote.dart';

class StripeRepository {

  Future<StripeModel> getClientSecret(double amount)  {
   return  StripeRemote().getClientSecret(amount);
  }
}