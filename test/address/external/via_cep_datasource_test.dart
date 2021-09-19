import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fotonica_ui_components/address/_exports.dart';
import 'package:fotonica_ui_components/address/domain/errors/erros.dart';
import 'package:fotonica_ui_components/address/external/datasources/via_cep_datasource.dart';
import 'package:mockito/mockito.dart';

class DioMockSuccess extends Mock implements Dio {
  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    String json = r'''
      {
        "cep": "59080-450",
        "logradouro": "Rua Raimundo de Medeiros Dantas",
        "complemento": "",
        "bairro": "Neópolis",
        "localidade": "Natal",
        "uf": "RN",
        "ibge": "2408102",
        "gia": "",
        "ddd": "84",
        "siafi": "1761"
      }
      ''';

    return Response<T>(
        requestOptions: RequestOptions(path: path),
        data: jsonDecode(json),
        statusCode: 200);
  }
}

class DioMockInvalidCep extends Mock implements Dio {
  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress}) async {
    String json = r'''
      {
        "erro": true
      }
      ''';

    return Response<T>(
        requestOptions: RequestOptions(path: path),
        data: jsonDecode(json),
        statusCode: 200);
  }
}

class DioMockAddressNull extends Mock implements Dio {
  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress}) async {
    String json = r'''
      {
        "qq": "anything"
      }
      ''';

    return Response<T>(
        requestOptions: RequestOptions(path: path),
        data: jsonDecode(json),
        statusCode: 400);
  }
}

void main() {
  String cep = "59080-450";

  group("ViaCepDatasource | ", (){
    test("find address by cep successfully", () async {
      Dio dio = DioMockSuccess();
      IAddressDatasource addressDatasource = ViaCepDatasource(dio: dio);

      AddressModel address = await addressDatasource.findAddressByCep(cep);
      expect(address, isNotNull);
      expect(address.cep, cep);
      expect(address.state, "RN");
    });

    test("return InvalidCepFailure if cep number is wrong", () async {
      Dio dio = DioMockInvalidCep();
      IAddressDatasource addressDatasource = ViaCepDatasource(dio: dio);
      try {
        await addressDatasource.findAddressByCep(cep);
      } catch (e) {
        expect(e, isException);
        expect(e, isInstanceOf<InvalidCepFailure>());
      }
    });

    test("return null when statusCode differ 200", () async {
      Dio dio = DioMockAddressNull();
      IAddressDatasource addressDatasource = ViaCepDatasource(dio: dio);
      try{
        await addressDatasource.findAddressByCep(cep);
      } catch(e){
        expect(e, isException);
        expect(e, isInstanceOf<DatasourceResultNull>());
      }
    });
  });
}
