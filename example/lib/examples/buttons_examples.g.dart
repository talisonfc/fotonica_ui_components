// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buttons_examples.dart';

// **************************************************************************
// Generator: CodeSnaphostGeneretor
// **************************************************************************

extension ButtonsExamplesSourceCode on ButtonsExamples {
  get sourceCode {
    return "import 'dart:async';\n"
        "\n"
        "import 'package:annotations/annotations.dart';\n"
        "import 'package:example/example.dart';\n"
        "import 'package:flutter/material.dart';\n"
        "import 'package:fotonica_ui_components/fotonica_button.dart';\n"
        "\n"
        "part 'buttons_examples.g.dart';\n"
        "\n"
        "@generateCodeSnapshot\n"
        "class ButtonsExamples extends Example {\n"
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
        "class ButtonsExamplesState extends State<ButtonsExamples> {\n"
        "  @override\n"
        "  Widget build(BuildContext context) {\n"
        "    return Column(\n"
        "      children: [\n"
        "        Text(\"Simple button\"),\n"
        "        FotonicaButton(\n"
        "            label: \"Toque aqui\",\n"
        "            onPressed: () async {\n"
        "              // simulate a request\n"
        "              return Future.delayed(Duration(seconds: 2));\n"
        "            }),\n"
        "        SizedBox(\n"
        "          height: 16,\n"
        "        ),\n"
        "        Text(\"Button with icon\"),\n"
        "        FotonicaButton(\n"
        "            color: Theme.of(context).primaryColor,\n"
        "            labelColor: Colors.white,\n"
        "            icon: Icon(Icons.house, color: Colors.white,),\n"
        "            label: \"Toque aqui\",\n"
        "            onPressed: () async {\n"
        "              // simulate a request\n"
        "              return Future.delayed(Duration(seconds: 2));\n"
        "            })\n"
        "      ],\n"
        "    );\n"
        "  }\n"
        "}\n"
        "\n";
  }
}
