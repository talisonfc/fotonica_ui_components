import '../_exports.dart';

abstract class IAddressDatasource {

  Future<AddressModel> findAddressByCep(String cep);
}