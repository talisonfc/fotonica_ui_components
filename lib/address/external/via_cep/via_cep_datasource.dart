
import 'package:dio/dio.dart';

import '../../_exports.dart';

class ViaCepDatasource implements IAddressDatasource {
  final Dio dio;

  ViaCepDatasource({required this.dio});

  @override
  Future<AddressModel> findAddressByCep(String cep) async {
    Response response = await dio.get("/viacep");
    return AddressModel.fromJson(response.data);
  }

}