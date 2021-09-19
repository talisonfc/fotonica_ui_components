
import 'package:dio/dio.dart';
import 'package:fotonica_ui_components/address/domain/errors/erros.dart';

import '../../_exports.dart';

class ViaCepDatasource implements IAddressDatasource {
  final Dio dio;

  ViaCepDatasource({required this.dio});

  @override
  Future<AddressModel> findAddressByCep(String cep) async {
    Response response = await dio.get("/ws/$cep/json");
    if(response.statusCode == 200) {
      Map<String, dynamic> result = response.data;
      if(result.containsKey("erro"))
        throw InvalidCepFailure();
      return AddressModel.fromJson(response.data);
    }
    throw DatasourceResultNull();
  }

}