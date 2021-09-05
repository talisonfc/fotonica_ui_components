// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buttons_examples.dart';

// **************************************************************************
// Generator: CodeSnaphostGeneretor
// **************************************************************************

extension ButtonsExamplesSourceCode on ButtonsExamples {
  get sourceCode {
    return "\n"
        "import 'dart:async';\n"
        "import 'dart:io';\n"
        "\n"
        "import 'package:annotations/annotations.dart';\n"
        "import 'package:example/example.dart';\n"
        "import 'package:flutter/material.dart';\n"
        "import 'package:fotonica_ui_components/fotonica_elevated_button.dart';\n"
        "\n"
        "part 'buttons_examples.g.dart';\n"
        "\n"
        "@generateCodeSnapshot\n"
        "class ButtonsExamples extends Example {\n"
        "\n"
        "  get code {\n"
        "    return sourceCode;\n"
        "  }\n"
        "\n"
        "  @override\n"
        "  State<StatefulWidget> createState() {\n"
        "    return ButtonsExamplesState();\n"
        "  }\n"
        "}\n"
        "\n"
        "class ButtonsExamplesState extends State<ButtonsExamples>{\n"
        "\n"
        "  @override\n"
        "  Widget build(BuildContext context) {\n"
        "\n"
        "    return ListView(\n"
        "      shrinkWrap: true,\n"
        "      children: [\n"
        "        FotonicaElevatedButton(label: \"Toque aqui\", onPressed: () async {\n"
        "          // simulate a request\n"
        "          return Future.delayed(Duration(seconds: 2));\n"
        "        }),\n"
        "      ],\n"
        "    );\n"
        "  }\n"
        "}\n";
  }
}
