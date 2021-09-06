// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snackbar_examples.dart';

// **************************************************************************
// Generator: CodeSnaphostGeneretor
// **************************************************************************

extension SnackbarExamplesSourceCode on SnackbarExamples {
  get sourceCode {
    return "import 'package:annotations/annotations.dart';\n"
        "import 'package:example/example.dart';\n"
        "import 'package:flutter/material.dart';\n"
        "import 'package:fotonica_ui_components/util/fotonica_snackbar.dart';\n"
        "\n"
        "part 'snackbar_examples.g.dart';\n"
        "\n"
        "@generateCodeSnapshot\n"
        "class SnackbarExamples extends Example {\n"
        "  @override\n"
        "  State<StatefulWidget> createState() {\n"
        "    return SnackbarExamplesState();\n"
        "  }\n"
        "\n"
        "  @override\n"
        "  get code => sourceCode;\n"
        "}\n"
        "\n"
        "class SnackbarExamplesState extends State<SnackbarExamples> {\n"
        "  @override\n"
        "  Widget build(BuildContext context) {\n"
        "    return ListView(\n"
        "      shrinkWrap: true,\n"
        "      children: [\n"
        "        Text(\"Click on button to show snackbar\"),\n"
        "        SizedBox(height: 16,),\n"
        "        ElevatedButton(\n"
        "            onPressed: () {\n"
        "              FotonicaSnackbar.success(\n"
        "                  context: context, content: Text(\"Mensagem de sucesso\"));\n"
        "            },\n"
        "            child: Text(\"Show Snackbar Sucess\")),\n"
        "        SizedBox(height: 16,),\n"
        "        ElevatedButton(\n"
        "            onPressed: () {\n"
        "              FotonicaSnackbar.erro(\n"
        "                  context: context, content: Text(\"Mensagem de error\"));\n"
        "            },\n"
        "            child: Text(\"Show Snackbar Error\"))\n"
        "      ],\n"
        "    );\n"
        "  }\n"
        "}\n"
        "\n";
  }
}
