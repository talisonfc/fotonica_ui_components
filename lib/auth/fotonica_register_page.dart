import 'package:flutter/material.dart';
import 'package:fotonica_ui_components/fotonica_elevated_button.dart';
import 'package:fotonica_ui_components/fotonica_text_field.dart';
import 'package:fotonica_ui_components/fotonica_warn.dart';

typedef Future<void> RegisterFunction(String email, String pswd);

class FotonicaRegisterPage extends StatefulWidget {
  final RegisterFunction onRegister;
  final Widget appLogo;

  FotonicaRegisterPage({required this.onRegister, required this.appLogo});

  @override
  State<StatefulWidget> createState() {
    return ForgetPasswordPageState();
  }
}

class ForgetPasswordPageState extends State<FotonicaRegisterPage> {
  GlobalKey<FormState> _formRegisterUser = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String confirmPwd = "";
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            widget.appLogo,
            Form(
              key: _formRegisterUser,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(16),
                children: [
                  Text(
                    "Criar conta",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text("Digite seu E-mail e senha"),
                  FotonicaTextField(
                    label: "E-mail",
                    controller: TextEditingController(text: email),
                    onChange: (v) {
                      email = v;
                    },
                    validator: (String? v) {
                      if (v == null || v.isEmpty) return "Digite seu E-mail";
                      if (!v.contains("@")) return "E-mail inválido";
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
                        return "Digite uma senha";
                      }
                      return null;
                    },
                  ),
                  FotonicaTextField(
                    label: "Repetir senha",
                    controller: TextEditingController(text: confirmPwd),
                    onChange: (v) {
                      confirmPwd = v;
                    },
                    obscureText: true,
                    maxLines: 1,
                    validator: (String? v) {
                      if (v == null || v.isEmpty) return "Digite uma senha";
                      if (password != v) return "As senhas não são iguais";
                      return null;
                    },
                  ),
                  if (message.isNotEmpty)
                    FotonicaWarn(
                      message: message,
                      type: WarnType.error,
                    ),
                  FotonicaElevatedButton(
                    label: "Criar",
                    onPressed: () async {
                      if (_formRegisterUser.currentState!.validate()) {
                        widget.onRegister(email, password).then((_) {
                          Navigator.pop(context);
                        }).catchError((err) {
                          setState(() {
                            message = err.message;
                          });
                        });
                      }
                    },
                  ),
                  FotonicaElevatedButton(
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

  @override
  void dispose() {
    super.dispose();
  }
}
