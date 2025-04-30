import 'package:retail/data/address/model/address_model.dart';
import 'package:retail/domain/address/repository/address_repository.dart';

class AddressUsecase {
  Future<List<AddressModel>> getAllAddress() async {
    return await AddressRepository().getAllAddress();
  }
}