import 'package:annotations/annotations.dart';
import 'package:example/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fotonica_ui_components/fotonica_text_field.dart';

part 'text_field_examples.g.dart';

@generateCodeSnapshot
class TextFieldExamples extends Example {
  @override
  get code => sourceCode;

  @override
  State<StatefulWidget> createState() {
    return TextFieldExamplesState();
  }
}

class TextFieldExamplesState extends State<TextFieldExamples> {
  bool showPassword = false;
  String password = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text(""),
        FotonicaTextField(
            label: "Label",
            placeholder: "Placeholder",
            controller: TextEditingController(text: ""),
            onChange: (v) {}),
        FotonicaTextField(
            label: "E-mail",
            prefixIcon: Icon(Icons.email),
            placeholder: "Placeholder",
            controller: TextEditingController(text: ""),
            onChange: (v) {}),
        FotonicaTextField(
          label: "Password",
          prefixIcon: Icon(Icons.password),
          suffixIcon: Wrap(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(showPassword ? Icons.remove_red_eye : Icons.close))
            ],
          ),
          placeholder: "Password",
          obscureText: showPassword,
        ),
        FotonicaTextField(
          label: "Label",
          placeholder: "Placeholder",
          suffixIcon: Wrap(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.code),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.extension),
              )
            ],
          ),
        )
      ],
    );
  }
}
