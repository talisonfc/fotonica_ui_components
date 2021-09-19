import 'package:flutter_test/flutter_test.dart';
import 'package:fotonica_ui_components/address/_exports.dart';
import 'package:fotonica_ui_components/address/data/repositories/address_repository_impl.dart';
import 'package:fotonica_ui_components/address/domain/errors/erros.dart';
import 'package:mockito/mockito.dart';

class AddressRepositoryMockSuccess extends Mock implements IAddressDatasource {

  @override
  Future<AddressModel> findAddressByCep(String cep) async {
    return AddressModel(cep: cep,
        street: "Ruia Raimundo",
        city: "Natal",
        country: "Brasil",
        state: "RN");
  }
}

class AddressRepositoryMockInvalidCep extends Mock implements IAddressDatasource {

  @override
  Future<AddressModel> findAddressByCep(String cep) async {
    throw InvalidCepFailure();
  }
}

class AddressRepositoryMockNull extends Mock implements IAddressDatasource {

  @override
  Future<AddressModel> findAddressByCep(String cep) async {
    throw DatasourceResultNull();
  }
}

void main() {
  group("AddressRepository | ", () {

    test("find sucessfull address", () async {
      String cep = "59080-450";
      IAddressRepository addressRepository = AddressRepositoryImpl(
          addressDatasource: AddressRepositoryMockSuccess());

      Address addressModel = await addressRepository.findAddressByCep(cep);
      expect(addressModel, isNotNull);
      expect(addressModel.cep, cep);
    });

    test("return InvaliCepFailure", () async {
      String cep = "59080-45";
      IAddressRepository addressRepository = AddressRepositoryImpl(
          addressDatasource: AddressRepositoryMockInvalidCep());

      try {
        await addressRepository.findAddressByCep(cep);
      } catch(e){
        expect(e, isException);
        expect(e, isInstanceOf<InvalidCepFailure>());
      }
    });

    test("return DatasourceResultNull", () async {
      String cep = "59080-45";
      IAddressRepository addressRepository = AddressRepositoryImpl(
          addressDatasource: AddressRepositoryMockNull());

      try {
        await addressRepository.findAddressByCep(cep);
      } catch(e){
        expect(e, isException);
        expect(e, isInstanceOf<DatasourceResultNull>());
      }
    });
  });
}