import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fotonica_ui_components/auth/fotonica_forget_password_page.dart';
import 'package:fotonica_ui_components/auth/fotonica_register_page.dart';
import 'package:fotonica_ui_components/fotonica_button.dart';
import 'package:fotonica_ui_components/fotonica_text_field.dart';
import 'package:fotonica_ui_components/fotonica_warn.dart';

typedef Future SignInWithEmailAndPasswordFuntion(String email, String password);

class FotonicaLoginPage extends StatefulWidget {
  final VoidCallback? signInWithGoogle;
  final SignInWithEmailAndPasswordFuntion? signInWithEmailAndPassword;
  final VoidCallback? signInWithFacebook;
  final RecoverPasswordFunction onRecover;
  final RegisterFunction onRegister;
  final Widget appLogo;

  FotonicaLoginPage(
      {this.signInWithGoogle,
      this.signInWithEmailAndPassword,
      this.signInWithFacebook,
      required this.appLogo,
      required this.onRegister,
      required this.onRecover});

  @override
  State<StatefulWidget> createState() {
    return FotonicaLoginPageState();
  }
}

class FotonicaLoginPageState extends State<FotonicaLoginPage> {
  GlobalKey<FormState> _formLoginWithEmailAndPswd = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String message = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            widget.appLogo,
            Form(
              key: _formLoginWithEmailAndPswd,
              child: ListView(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.all(16.0),
                children: [
                  Text("Digite seu E-mail e senha para entrar"),
                  FotonicaTextField(
                    label: "E-mail",
                    controller: TextEditingController(text: email),
                    onChange: (v) {
                      email = v;
                    },
                    validator: (String? v) {
                      if (v == null || v.isEmpty) {
                        return "Digite seu E-mail";
                      }
                      return null;
                    },
                  ),
                  FotonicaTextField(
                    label: "Senha",
                    controller: TextEditingController(text: password),
                    onChange: (v) {
                      password = v;
                    },
                    obscureText: true,
                    maxLines: 1,
                    validator: (String? v) {
                      if (v == null || v.isEmpty) {
                        return "Digite sua senha";
                      }
                      return null;
                    },
                  ),
                  if (message.isNotEmpty)
                    FotonicaWarn(
                      message: message,
                      type: WarnType.error,
                    ),
                  FotonicaButton(
                    label: "Entrar",
                    onPressed: () async {
                      if (_formLoginWithEmailAndPswd.currentState!.validate()) {
                        if (widget.signInWithEmailAndPassword != null) {
                          widget.signInWithEmailAndPassword!(email, password)
                              .then((_) {
                            setState(() {
                              message = "";
                            });
                          }).catchError((err) {
                            setState(() {
                              message = err.message;
                            });
                          });
                        }
                      }
                    },
                    color: Colors.grey[200],
                    // labelColor: Colors.white,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      FotonicaButton(
                          label: "Esqueceu a senha?",
                          onPressed: openForgetPasswordPage),
                      FotonicaButton(
                          label: "Criar conta",
                          onPressed: openRegisterPage)
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            ListView(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.all(16.0),
              children: [
                Text("Outras opções de acesso"),
                FotonicaButton(
                  onPressed: () async {
                    if (widget.signInWithGoogle != null)
                      widget.signInWithGoogle!();
                  },
                  icon: Icon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                  ),
                  label: "Entrar com Google",
                  color: Colors.red,
                  labelColor: Colors.white,
                ),
                // FotonicaButton(
                //   onPressed: widget.signInWithFacebook != null
                //       ? widget.signInWithFacebook!
                //       : () {},
                //   icon: Icon(
                //     FontAwesomeIcons.facebook,
                //     color: Colors.white,
                //   ),
                //   label: "Entrar com Facebook",
                //   color: Colors.blue,
                //   labelColor: Colors.white,
                // )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> openForgetPasswordPage() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => FotonicaForgetPasswordPage(
                  onRecover: widget.onRecover,
                  appLogo: widget.appLogo,
                )));
  }

  Future<void> openRegisterPage() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => FotonicaRegisterPage(
                  onRegister: widget.onRegister,
                  appLogo: widget.appLogo,
                )));
  }
}
