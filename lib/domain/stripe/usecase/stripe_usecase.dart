import 'package:retail/data/stripe/model/stripe_model.dart';
import 'package:retail/domain/stripe/repository/stripe_repository.dart';

class StripeUsecase {

  Future<StripeModel> getCleintSecret(double amount){
    return StripeRepository().getClientSecret(amount);
  }
}