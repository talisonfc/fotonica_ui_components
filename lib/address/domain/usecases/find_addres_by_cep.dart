

import '../_exports.dart';

class FindAddressByCep {

  final IAddressRepository addressRepository;

  FindAddressByCep({required this.addressRepository});

  Future<Address> call(String cep){
    return addressRepository.findAddressByCep(cep);
  }
}