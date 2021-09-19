

import '../_exports.dart';

mixin IFindAddressByCep {
  Future<Address> call(String cep);
}

class FindAddressByCep implements IFindAddressByCep{

  final IAddressRepository addressRepository;

  FindAddressByCep({required this.addressRepository});

  @override
  Future<Address> call(String cep){
    return addressRepository.findAddressByCep(cep);
  }
}