import 'package:fotonica_ui_components/address/domain/entities/address.dart';

class AddressModel extends Address {
  AddressModel(
      {required String cep,
      required String street,
      String? complement,
      required String city,
      required String country,
      required String state,
      String number = "SN",
      String? district,
      double? lat,
      double? lng})
      : super(
            cep: cep,
            street: street,
            complement: complement,
            city: city,
            country: country,
            state: state,
            number: number,
            district: district,
            lat: lat,
            lng: lng);

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        cep: json["cep"],
        street: json["logradouro"],
        district: json["bairro"],
        city: json["localidade"],
        state: json["uf"],
        country: "Brasil");
  }

  String? get fullAddress {
    // if (logradouro != null) {
    //   String address = "";
    //   address += logradouro!;
    //   address += ", ${numero ?? "SN"}";
    //   address += ", $bairro";
    //   address += ", $cep";
    //   address += ", $localidade";
    //   address += ", $uf";
    //   return address;
    // }
    return null;
  }
}
