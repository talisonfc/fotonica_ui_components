

import 'package:dio/dio.dart';
import 'package:fotonica_ui_components/address/data/models/via_cep_address.dart';

class AddressController {
  Dio viaCepApi = Dio(BaseOptions(baseUrl: "https://viacep.com.br/ws/"));

  Future<ViaCepAddress> readAddresByCep(String cep) {
    return viaCepApi.get("$cep/json").then((response) {
      return ViaCepAddress.fromJson(response.data);
    }).catchError((err) {
      throw err;
    });
  }
}