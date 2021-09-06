// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_examples.dart';

// **************************************************************************
// Generator: CodeSnaphostGeneretor
// **************************************************************************

extension AddressExamplesSourceCode on AddressExamples {
  get sourceCode {
    return "import 'package:annotations/annotations.dart';\n"
        "import 'package:example/example.dart';\n"
        "import 'package:flutter/material.dart';\n"
        "import 'package:fotonica_ui_components/address/fotonica_address.dart';\n"
        "import 'package:fotonica_ui_components/address/via_cep_address.dart';\n"
        "\n"
        "part 'address_examples.g.dart';\n"
        "\n"
        "@generateCodeSnapshot\n"
        "class AddressExamples extends Example {\n"
        "  @override\n"
        "  get code => sourceCode;\n"
        "\n"
        "  @override\n"
        "  State<StatefulWidget> createState() {\n"
        "    return AddressExamplesState();\n"
        "  }\n"
        "}\n"
        "\n"
        "class AddressExamplesState extends State<AddressExamples> {\n"
        "  @override\n"
        "  Widget build(BuildContext context) {\n"
        "    return ListView(\n"
        "      shrinkWrap: true,\n"
        "      children: [\n"
        "        FotonicaAddress(viaCepAddress: ViaCepAddress(), onChange: (v) {})\n"
        "      ],\n"
        "    );\n"
        "  }\n"
        "}\n"
        "\n";
  }
}
