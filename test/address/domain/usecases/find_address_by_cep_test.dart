import 'package:flutter_test/flutter_test.dart';
import 'package:fotonica_ui_components/address/_exports.dart';
import 'package:fotonica_ui_components/address/domain/errors/erros.dart';
import 'package:mockito/mockito.dart';

class AddressRepositoryMockSuccessful extends Mock
    implements IAddressRepository {
  @override
  Future<Address> findAddressByCep(String cep) async {
    return Address(
        cep: cep,
        street: "Rua Raimundo",
        city: "Natal",
        country: "Brazil",
        state: "RN");
  }
}

class AddressRepositoryMockInvalidCep extends Mock
    implements IAddressRepository {
  @override
  Future<Address> findAddressByCep(String cep) async {
    throw InvalidCepFailure();
  }
}

class AddressRepositoryMockNull extends Mock implements IAddressRepository {
  @override
  Future<Address> findAddressByCep(String cep) async {
    throw DatasourceResultNull();
  }
}

void main() {
  group("usecase find_address_by_cep", (){
    test("find address by cep", () async {
      FindAddressByCep findAddressByCep =
      FindAddressByCep(addressRepository: AddressRepositoryMockSuccessful());
      String cep = "58080-450";
      Address address = await findAddressByCep(cep);
      expect(address, isNotNull);
      expect(address.cep, cep);
    });

    test("return invalid cep failure", () async {
      FindAddressByCep findAddressByCep =
      FindAddressByCep(addressRepository: AddressRepositoryMockInvalidCep());
      String cep = "58080-450";
      try {
        await findAddressByCep(cep);
      } catch (e) {
        expect(e, isException);
        expect(e, isInstanceOf<InvalidCepFailure>());
      }
    });

    test("return null value", () async {
      FindAddressByCep findAddressByCep =
      FindAddressByCep(addressRepository: AddressRepositoryMockSuccessful());
      String cep = "58080-450";
      try {
        await findAddressByCep(cep);
      } catch (e) {
        expect(e, isException);
        expect(e, isInstanceOf<DatasourceResultNull>());
      }
    });
  });
}
