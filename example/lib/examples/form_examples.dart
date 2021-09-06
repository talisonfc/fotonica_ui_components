import 'package:annotations/annotations.dart';
import 'package:example/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fotonica_ui_components/fotonica_button.dart';
import 'package:fotonica_ui_components/fotonica_text_field.dart';

part "form_examples.g.dart";

@generateCodeSnapshot
class FormExamples extends Example {
  @override
  get code => sourceCode;

  @override
  State<StatefulWidget> createState() {
    return FormExamplesState();
  }
}

class FormExamplesState extends State<FormExamples> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  FormModel formModel = FormModel();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text("Form with validation"),
        Form(
            key: _form,
            child: ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                FotonicaTextField(
                  label: "First name",
                  controller: TextEditingController(text: formModel.firstName),
                ),
                FotonicaTextField(
                  label: "Last name",
                  controller: TextEditingController(text: formModel.lastName),
                ),
                FotonicaTextField(
                  label: "E-mail",
                  controller: TextEditingController(text: formModel.email),
                  validator: (String? v) {
                    if (v == null || v.isEmpty) return "E-mail can't be empty";
                  },
                ),
                FotonicaTextField(
                  label: "CPF",
                  controller: TextEditingController(text: formModel.cpf),
                  inputFormatters: [
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      if (newValue.text.length > 3)
                        return TextEditingValue(text: newValue.text + ".");
                      else
                        return newValue;
                    })
                  ],
                ),
                FotonicaTextField(
                  label: "Phone",
                  controller:
                      TextEditingController(text: formModel.phoneNumber),
                ),
                SizedBox(
                  height: 16,
                ),
                FotonicaButton(
                    label: "Salvar",
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        print(formModel);
                        return Future.delayed(Duration(seconds: 2), () {
                          return;
                        });
                      }
                      return Future.value();
                    })
              ],
            ))
      ],
    );
  }
}

class FormModel {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String cpf;

  FormModel(
      {this.firstName = "",
      this.lastName = "",
      this.phoneNumber = "",
      this.email = "",
      this.cpf = ""});
}
