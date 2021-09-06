// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_examples.dart';

// **************************************************************************
// Generator: CodeSnaphostGeneretor
// **************************************************************************

extension AuthExamplesSourceCode on AuthExamples {
  get sourceCode {
    return "import 'package:annotations/annotations.dart';\n"
        "import 'package:example/example.dart';\n"
        "import 'package:flutter/material.dart';\n"
        "import 'package:fotonica_ui_components/auth/fotonica_forget_password_page.dart';\n"
        "import 'package:fotonica_ui_components/auth/fotonica_login_page.dart';\n"
        "import 'package:fotonica_ui_components/auth/fotonica_register_page.dart';\n"
        "\n"
        "part 'auth_examples.g.dart';\n"
        "\n"
        "@generateCodeSnapshot\n"
        "class AuthExamples extends Example {\n"
        "  @override\n"
        "  get code => sourceCode;\n"
        "\n"
        "  @override\n"
        "  State<StatefulWidget> createState() {\n"
        "    return AuthExamplesSate();\n"
        "  }\n"
        "}\n"
        "\n"
        "class AuthExamplesSate extends State<AuthExamples> {\n"
        "  @override\n"
        "  Widget build(BuildContext context) {\n"
        "    return Column(\n"
        "      // shrinkWrap: true,\n"
        "      children: [\n"
        "        Text(\"Login page\"),\n"
        "        Container(\n"
        "          width: 300,\n"
        "          height: 600,\n"
        "          child: FotonicaLoginPage(\n"
        "              appLogo: Icon(Icons.local_gas_station),\n"
        "              onRegister: (String username, String password) async {},\n"
        "              onRecover: (String email) async {}),\n"
        "        ),\n"
        "        Text(\"Register page\"),\n"
        "        Container(\n"
        "          width: 300,\n"
        "          height: 600,\n"
        "          child: FotonicaRegisterPage(\n"
        "              appLogo: Icon(Icons.local_gas_station),\n"
        "              onRegister: (String username, String password) async {}),\n"
        "        ),\n"
        "        Text(\"Recover page\"),\n"
        "        Container(\n"
        "          width: 300,\n"
        "          height: 600,\n"
        "          child: FotonicaForgetPasswordPage(\n"
        "            appLogo: Icon(Icons.local_gas_station),\n"
        "            onRecover: (String email) async {},\n"
        "          ),\n"
        "        ),\n"
        "      ],\n"
        "    );\n"
        "  }\n"
        "}\n"
        "\n";
  }
}
