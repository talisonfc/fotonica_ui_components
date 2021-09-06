// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog_examples.dart';

// **************************************************************************
// Generator: CodeSnaphostGeneretor
// **************************************************************************

extension DialogExamplesSourceCode on DialogExamples {
  get sourceCode {
    return "import 'package:annotations/annotations.dart';\n"
        "import 'package:example/example.dart';\n"
        "import 'package:flutter/material.dart';\n"
        "import 'package:fotonica_ui_components/simple_dialog_actions.dart';\n"
        "\n"
        "part 'dialog_examples.g.dart';\n"
        "\n"
        "@generateCodeSnapshot\n"
        "class DialogExamples extends Example {\n"
        "  @override\n"
        "  get code => sourceCode;\n"
        "\n"
        "  @override\n"
        "  State<StatefulWidget> createState() {\n"
        "    return DialogExamplesState();\n"
        "  }\n"
        "}\n"
        "\n"
        "class DialogExamplesState extends State<DialogExamples> {\n"
        "  @override\n"
        "  Widget build(BuildContext context) {\n"
        "    return ListView(\n"
        "      shrinkWrap: true,\n"
        "      children: [ElevatedButton(onPressed: () {\n"
        "        showDialog(context: context, builder: (ctx){\n"
        "          return SimpleDialog(\n"
        "            title: Text(\"Title\"),\n"
        "            children: [\n"
        "              SimpleDialogActions(value: true)\n"
        "            ],\n"
        "          );\n"
        "        });\n"
        "      }, child: Text(\"Open dialog\"))],\n"
        "    );\n"
        "  }\n"
        "}\n"
        "\n";
  }
}
