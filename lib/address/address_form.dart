import 'package:flutter/material.dart';
import 'package:fotonica_ui_components/address/data/models/via_cep_address.dart';
import 'package:fotonica_ui_components/fotonica_text_field.dart';

class AddressForm extends StatelessWidget {
  final ViaCepAddress? viaCepAddress;
  final Function(ViaCepAddress? address)? onChange;

  AddressForm({this.viaCepAddress, this.onChange});

  bool isNotDefined(String value) {
    return value == null || value.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            viaCepAddress!.fullAddress ?? "Endereço não definido",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          subtitle: Text(viaCepAddress!.complemento ?? "Complemento não definido"),
        ),
        FotonicaTextField(
          label: "CEP",
          controller: TextEditingController(text: viaCepAddress!.cep),
          type: TextInputType.number,
          onChange: (cep) {
            viaCepAddress!.cep = cep;
          },
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ),
        FotonicaTextField(
          label: "Cidade",
          controller: TextEditingController(text: viaCepAddress!.localidade),
          onChange: (localidade) {
            viaCepAddress!.localidade = localidade;
          },
        ),
        FotonicaTextField(
          label: "Rua",
          controller: TextEditingController(text: viaCepAddress!.logradouro),
          onChange: (logradouro) {
            viaCepAddress!.logradouro = logradouro;
          },
        ),
        FotonicaTextField(
          label: "Número",
          type: TextInputType.number,
          controller: TextEditingController(text: viaCepAddress!.numero),
          onChange: (numero) {
            viaCepAddress!.numero = numero;
          },
        ),
        FotonicaTextField(
          label: "Bairro",
          controller: TextEditingController(text: viaCepAddress!.bairro),
          onChange: (bairro) {
            viaCepAddress!.logradouro = bairro;
          },
        ),
        FotonicaTextField(
          label: "Complemento",
          controller: TextEditingController(text: viaCepAddress!.complemento),
          onChange: (complemento) {
            viaCepAddress!.complemento = complemento;
          },
        ),
        TextButton(
            onPressed: () {
              if (onChange != null) onChange!(viaCepAddress);
              Navigator.pop(context);
            },
            child: Text(
              "Salvar",
              style: TextStyle(fontSize: 20),
            ))
      ],
    );
  }
}
