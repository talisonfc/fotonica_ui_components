import 'package:annotations/annotations.dart';
import 'package:example/example.dart';
import 'package:flutter/material.dart';
import 'package:fotonica_ui_components/address/fotonica_address.dart';
import 'package:fotonica_ui_components/address/via_cep_address.dart';

part 'address_examples.g.dart';

@generateCodeSnapshot
class AddressExamples extends Example {
  @override
  get code => sourceCode;

  @override
  State<StatefulWidget> createState() {
    return AddressExamplesState();
  }
}

class AddressExamplesState extends State<AddressExamples> {
  ViaCepAddress viaCepAddress = ViaCepAddress();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        FotonicaAddress(
            viaCepAddress: viaCepAddress,
            onChange: (v) {
              if (v != null)
                setState(() {
                  viaCepAddress = v;
                });
            })
      ],
    );
  }
}
