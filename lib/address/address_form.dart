import 'package:flutter/material.dart';
import 'package:fotonica_ui_components/address/_exports.dart';
import 'package:fotonica_ui_components/fotonica_text_field.dart';

import 'address_extension.dart';

class AddressForm extends StatelessWidget {
  final Address? address;
  final Function(Address? address)? onChange;
  final Function(String cep) searchByCep;

  AddressForm({this.address, this.onChange, required this.searchByCep});

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
            address!.fullAddress ?? "Endereço não definido",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          subtitle: Text(address!.complement ?? "Complemento não definido"),
        ),
        FotonicaTextField(
          label: "CEP",
          controller: TextEditingController(text: address!.cep),
          type: TextInputType.number,
          onChange: (cep) {
            address!.cep = cep;
          },
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              searchByCep(address!.cep);
            },
          ),
        ),
        FotonicaTextField(
          label: "Cidade",
          controller: TextEditingController(text: address!.city),
          onChange: (city) {
            address!.city = city;
          },
        ),
        FotonicaTextField(
          label: "Rua",
          controller: TextEditingController(text: address!.street),
          onChange: (street) {
            address!.street = street;
          },
        ),
        FotonicaTextField(
          label: "Número",
          type: TextInputType.number,
          controller: TextEditingController(text: address!.number),
          onChange: (number) {
            address!.number = number;
          },
        ),
        FotonicaTextField(
          label: "Bairro",
          controller: TextEditingController(text: address!.district),
          onChange: (district) {
            address!.district = district;
          },
        ),
        FotonicaTextField(
          label: "Complemento",
          controller: TextEditingController(text: address!.complement),
          onChange: (complement) {
            address!.complement = complement;
          },
        ),
        TextButton(
            onPressed: () {
              if (onChange != null) onChange!(address);
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
