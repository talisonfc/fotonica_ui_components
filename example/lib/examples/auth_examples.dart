import 'package:annotations/annotations.dart';
import 'package:example/example.dart';
import 'package:flutter/material.dart';
import 'package:fotonica_ui_components/auth/fotonica_forget_password_page.dart';
import 'package:fotonica_ui_components/auth/fotonica_login_page.dart';
import 'package:fotonica_ui_components/auth/fotonica_register_page.dart';

part 'auth_examples.g.dart';

@generateCodeSnapshot
class AuthExamples extends Example {
  @override
  get code => sourceCode;

  @override
  State<StatefulWidget> createState() {
    return AuthExamplesSate();
  }
}

class AuthExamplesSate extends State<AuthExamples> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // shrinkWrap: true,
      children: [
        Text("Login page"),
        Container(
          width: 300,
          height: 600,
          child: FotonicaLoginPage(
              appLogo: Icon(Icons.local_gas_station),
              onRegister: (String username, String password) async {},
              onRecover: (String email) async {}),
        )
      ],
    );
  }
}
