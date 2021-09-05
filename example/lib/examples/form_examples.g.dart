// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_examples.dart';

// **************************************************************************
// Generator: CodeSnaphostGeneretor
// **************************************************************************

extension FormExamplesSourceCode on FormExamples {
  get sourceCode {
    return "import 'package:annotations/annotations.dart';\n"
        "import 'package:example/example.dart';\n"
        "import 'package:flutter/material.dart';\n"
        "import 'package:flutter/services.dart';\n"
        "import 'package:fotonica_ui_components/fotonica_elevated_button.dart';\n"
        "import 'package:fotonica_ui_components/fotonica_text_field.dart';\n"
        "\n"
        "part \"form_examples.g.dart\";\n"
        "\n"
        "@generateCodeSnapshot\n"
        "class FormExamples extends Example {\n"
        "  @override\n"
        "  get code => sourceCode;\n"
        "\n"
        "  @override\n"
        "  State<StatefulWidget> createState() {\n"
        "    return FormExamplesState();\n"
        "  }\n"
        "}\n"
        "\n"
        "class FormExamplesState extends State<FormExamples> {\n"
        "  GlobalKey<FormState> _form = GlobalKey<FormState>();\n"
        "  FormModel formModel = FormModel();\n"
        "\n"
        "  @override\n"
        "  Widget build(BuildContext context) {\n"
        "    return ListView(\n"
        "      shrinkWrap: true,\n"
        "      children: [\n"
        "        Text(\"Form with validation\"),\n"
        "        Form(\n"
        "            key: _form,\n"
        "            child: ListView(\n"
        "              shrinkWrap: true,\n"
        "              primary: false,\n"
        "              children: [\n"
        "                FotonicaTextField(\n"
        "                  label: \"First name\",\n"
        "                  controller: TextEditingController(text: formModel.firstName),\n"
        "                ),\n"
        "                FotonicaTextField(\n"
        "                  label: \"Last name\",\n"
        "                  controller: TextEditingController(text: formModel.lastName),\n"
        "                ),\n"
        "                FotonicaTextField(\n"
        "                  label: \"E-mail\",\n"
        "                  controller: TextEditingController(text: formModel.email),\n"
        "                  validator: (String? v) {\n"
        "                    if (v == null || v.isEmpty) return \"E-mail can't be empty\";\n"
        "                  },\n"
        "                ),\n"
        "                FotonicaTextField(\n"
        "                  label: \"CPF\",\n"
        "                  controller: TextEditingController(text: formModel.cpf),\n"
        "                  inputFormatters: [\n"
        "                    TextInputFormatter.withFunction((oldValue, newValue) {\n"
        "                      if (newValue.text.length > 3)\n"
        "                        return TextEditingValue(text: newValue.text + \".\");\n"
        "                      else\n"
        "                        return newValue;\n"
        "                    })\n"
        "                  ],\n"
        "                ),\n"
        "                FotonicaTextField(\n"
        "                  label: \"Phone\",\n"
        "                  controller:\n"
        "                      TextEditingController(text: formModel.phoneNumber),\n"
        "                ),\n"
        "                SizedBox(\n"
        "                  height: 16,\n"
        "                ),\n"
        "                FotonicaElevatedButton(\n"
        "                    label: \"Salvar\",\n"
        "                    onPressed: () {\n"
        "                      if (_form.currentState!.validate()) {\n"
        "                        print(formModel);\n"
        "                        return Future.delayed(Duration(seconds: 2), () {\n"
        "                          return;\n"
        "                        });\n"
        "                      }\n"
        "                      return Future.value();\n"
        "                    })\n"
        "              ],\n"
        "            ))\n"
        "      ],\n"
        "    );\n"
        "  }\n"
        "}\n"
        "\n"
        "class FormModel {\n"
        "  String firstName;\n"
        "  String lastName;\n"
        "  String email;\n"
        "  String phoneNumber;\n"
        "  String cpf;\n"
        "\n"
        "  FormModel(\n"
        "      {this.firstName = \"\",\n"
        "      this.lastName = \"\",\n"
        "      this.phoneNumber = \"\",\n"
        "      this.email = \"\",\n"
        "      this.cpf = \"\"});\n"
        "}\n"
        "\n";
  }
}