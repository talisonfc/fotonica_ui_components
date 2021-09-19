import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fotonica_ui_components/address/_exports.dart';
import 'package:fotonica_ui_components/address/address_form.dart';
import 'package:fotonica_ui_components/address/data/repositories/address_repository_impl.dart';
import 'package:fotonica_ui_components/address/external/datasources/via_cep_datasource.dart';
import 'package:fotonica_ui_components/fotonica_text_field.dart';
import 'package:fotonica_ui_components/util/fotonica_snackbar.dart';

class CepInput extends StatefulWidget {
  final Function(Address? address)? onChange;
  final Address? address;

  CepInput({this.onChange, this.address});

  @override
  State<StatefulWidget> createState() {
    return CepInputState();
  }
}

enum AddressState { cep, requestAddressByCep, form }

class CepInputState extends State<CepInput> {
  GlobalKey<FormState> _cepState = GlobalKey<FormState>();
  Address? _address;
  StreamController<AddressState> _steps = StreamController();
  IFindAddressByCep findAddressByCep = FindAddressByCep(
    addressRepository: AddressRepositoryImpl(
      addressDatasource: ViaCepDatasource(
        dio: Dio(BaseOptions(baseUrl: "https://viacep.com.br")),
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    _address = widget.address;

    if (widget.address != null &&
        _address!.cep.isNotEmpty)
      _steps.add(AddressState.form);
    else
      _steps.add(AddressState.cep);
  }

  void readAddresByCep(String cep) {
    if (_address!.cep.isNotEmpty) {
      findAddressByCep(cep).then((address) {
        _address = address;
        _steps.add(AddressState.form);
      }).catchError((err) {
        print(err);
        _address =
            Address(cep: "", street: "", city: "", country: "", state: "");
        _steps.add(AddressState.form);
        FotonicaSnackbar.erro(
            context: context, content: Text("Endereço não encontrado!"));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        StreamBuilder(
            stream: _steps.stream,
            builder: (context, AsyncSnapshot<AddressState> snap) {
              switch (snap.connectionState) {
                case ConnectionState.none:
                  return Text("none");
                case ConnectionState.waiting:
                  Size _size = MediaQuery.of(context).size;
                  return Container(
                    width: _size.width,
                    height: _size.width,
                    child: Center(child: CircularProgressIndicator()),
                  );
                case ConnectionState.active:
                  if (snap.data == AddressState.cep)
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: RichText(
                            text: TextSpan(
                                style: Theme.of(context).textTheme.bodyText1,
                                children: [
                                  TextSpan(
                                      text:
                                          "Digite seu CEP no campo abaixo ou"),
                                  TextSpan(
                                      text: " clique aqui ",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print(
                                              "abrir pagina de carregamento da latitude e longitude");
                                        },
                                      style: TextStyle(color: Colors.blue)),
                                  TextSpan(text: "para obter sua localização")
                                ]),
                          ),
                        ),
                        Form(
                          key: _cepState,
                          child: FotonicaTextField(
                              initialValue: _address?.cep,
                              placeholder: "CEP",
                              type: TextInputType.number,
                              validator: (cep) {
                                if (cep == null || cep.isEmpty)
                                  return "Digite um CEP valido";
                                return null;
                              },
                              onChange: (cep) {
                                _address!.cep = cep;
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: TextButton(
                              onPressed: () {
                                if (_cepState.currentState!.validate()) {
                                  _steps.add(AddressState.requestAddressByCep);
                                  readAddresByCep(_address!.cep);
                                }
                              },
                              child: Text(
                                "Pesquisar",
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                      ],
                    );
                  else if (snap.data == AddressState.requestAddressByCep)
                    return Container(
                      height: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Center(
                              child: CircularProgressIndicator(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Carregando endereço...",
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  return AddressForm(
                    address: _address,
                    onChange: (address) {
                      if (widget.onChange != null) {
                        widget.onChange!(_address);
                      }
                    },
                    searchByCep: readAddresByCep,
                  );
                case ConnectionState.done:
                  {
                    return Text("done");
                  }
                default:
                  {
                    return Text("Inválido");
                  }
              }
            }),
        // TextButton(
        //     onPressed: () {
        //       _steps.add(AddressState.form);
        //     },
        //     child: Text("Next"))
      ],
    );
  }
}
