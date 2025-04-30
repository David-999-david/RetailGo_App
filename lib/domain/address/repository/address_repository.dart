import 'package:retail/data/address/model/address_model.dart';
import 'package:retail/data/address/remote/address_remote.dart';

class AddressRepository {
  Future<List<AddressModel>> getAllAddress() {
    return AddressRemote().getAllAddress();
  }
}