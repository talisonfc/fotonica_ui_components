
import '../_exports.dart';

abstract class IAddressRepository {
  Future<Address> findAddressByCep(String cep);
}