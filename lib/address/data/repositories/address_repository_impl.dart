
import 'package:fotonica_ui_components/address/data/_exports.dart';

import '../../_exports.dart';

class AddressRepositoryImpl implements IAddressRepository {

  final IAddressDatasource addressDatasource;

  AddressRepositoryImpl(this.addressDatasource);

  @override
  Future<Address> findAddressByCep(String cep) {
    return addressDatasource.findAddressByCep(cep);
  }

}