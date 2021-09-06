import 'package:flutter/material.dart';
import 'package:fotonica_ui_components/fotonica_button.dart';
import 'package:fotonica_ui_components/fotonica_text_field.dart';
import 'package:fotonica_ui_components/fotonica_warn.dart';

typedef Future<void> RecoverPasswordFunction(String email);

class FotonicaForgetPasswordPage extends StatefulWidget {
  final RecoverPasswordFunction onRecover;
  final Widget appLogo;

  FotonicaForgetPasswordPage({required this.onRecover, required this.appLogo});

  @override
  State<StatefulWidget> createState() {
    return FotonicaForgetPasswordPageState();
  }
}

class FotonicaForgetPasswordPageState
    extends State<FotonicaForgetPasswordPage> {
  GlobalKey<FormState> _formForgetPassword = GlobalKey<FormState>();
  String email = "";
  bool showInfo = false;
  WarnType warnType = WarnType.info;
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            widget.appLogo,
            Form(
              key: _formForgetPassword,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                shrinkWrap: true,
                primary: false,
                children: [
                  Text(
                    "Recuperar acesso",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text("Digite seu E-mail"),
                  FotonicaTextField(
                    label: "E-mail",
                    controller: TextEditingController(text: email),
                    onChange: (v) {
                      email = v;
                    },
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Digite seu E-mail";
                      }
                      return null;
                    },
                  ),
                  if (showInfo)
                    FotonicaWarn(
                      message: message,
                      type: warnType,
                    ),
                  FotonicaButton(
                    label: "Recuperar",
                    onPressed: () async {
                      if (_formForgetPassword.currentState!.validate()) {
                        widget.onRecover(email).then((_) {
                          setState(() {
                            message =
                                "Acesse seu E-mail e clique no link enviado para recuperar sua senha.";
                            showInfo = true;
                            warnType = WarnType.info;
                          });
                        }).catchError((err) {
                          setState(() {
                            message = err.message;
                            showInfo = true;
                            warnType = WarnType.error;
                          });
                        });
                      }
                    },
                  ),
                  FotonicaButton(
                    label: "Voltar",
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
