import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fotonica_ui_components/address/address_form.dart';
import 'package:fotonica_ui_components/address/via_cep_address.dart';
import 'package:fotonica_ui_components/fotonica_text_field.dart';
import 'package:fotonica_ui_components/util/fotonica_snackbar.dart';

class CepInput extends StatefulWidget {
  final Function(ViaCepAddress? address)? onChange;
  final ViaCepAddress? address;

  CepInput({this.onChange, this.address});

  @override
  State<StatefulWidget> createState() {
    return CepInputState();
  }
}

enum AddressState { cep, requestAddressByCep, form }

class CepInputState extends State<CepInput> {
  GlobalKey<FormState> _cepState = GlobalKey<FormState>();
  Dio viaCepApi = Dio(BaseOptions(baseUrl: "https://viacep.com.br/ws/"));
  ViaCepAddress? _address;
  StreamController<AddressState> _steps = StreamController();

  @override
  void initState() {
    super.initState();
    _address = widget.address != null ? widget.address : ViaCepAddress();

    if (widget.address != null &&
        _address!.cep != null &&
        _address!.cep!.isNotEmpty)
      _steps.add(AddressState.form);
    else
      _steps.add(AddressState.cep);
  }

  void readAddresByCep() {
    String? cep = _address!.cep;
    viaCepApi.get("$cep/json").then((response) {
      _address = ViaCepAddress.fromJson(response.data);
      _steps.add(AddressState.form);
      // widget.onChange(_address);
    }).catchError((err) {
      _address = ViaCepAddress();
      _steps.add(AddressState.form);
      FotonicaSnackbar.erro(
          context: context, content: Text("Endereço não encontrado!"));
    });
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
                            initialValue: _address?.cep ?? "",
                            placeholder: "CEP",
                            controller: TextEditingController(
                                text: _address?.cep ?? ""),
                            type: TextInputType.number,
                            validator: (cep) {
                              if (cep == null || cep.isEmpty) return "Digite um CEP valido";
                              return null;
                            },
                            onChange: (cep) {
                                _address!.cep = cep;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: TextButton(
                              onPressed: () {
                                if (_cepState.currentState!.validate()) {
                                  _steps.add(AddressState.requestAddressByCep);
                                  readAddresByCep();
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
                    viaCepAddress: _address,
                    onChange: (address) {
                      if (widget.onChange != null) {
                        widget.onChange!(_address);
                      }
                    },
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
