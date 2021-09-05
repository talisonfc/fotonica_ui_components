// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buttons_example.dart';

// **************************************************************************
// Generator: CodeSnaphostGeneretor
// **************************************************************************

class ButtonsExampleSourceCode {
  String sourceCode = "\n"
      "import 'dart:async';\n"
      "import 'dart:io';\n"
      "\n"
      "import 'package:annotations/annotations.dart';\n"
      "import 'package:example/example.dart';\n"
      "import 'package:flutter/material.dart';\n"
      "import 'package:fotonica_ui_components/fotonica_elevated_button.dart';\n"
      "\n"
      "part 'buttons_example.g.dart';\n"
      "\n"
      "@generateCodeSnapshot\n"
      "class ButtonsExample extends Example {\n"
      "\n"
      "  @override\n"
      "  State<StatefulWidget> createState() {\n"
      "    return ButtonsExampleState();\n"
      "  }\n"
      "}\n"
      "\n"
      "class ButtonsExampleState extends State<ButtonsExample>{\n"
      "\n"
      "  @override\n"
      "  Widget build(BuildContext context) {\n"
      "\n"
      "    return ListView(\n"
      "      shrinkWrap: true,\n"
      "      children: [\n"
      "        FotonicaElevatedButton(label: \"Label\", onPressed: () async {\n"
      "          // simulate a request\n"
      "          return Future.delayed(Duration(seconds: 2));\n"
      "        }),\n"
      "      ],\n"
      "    );\n"
      "  }\n"
      "}\n";
}
