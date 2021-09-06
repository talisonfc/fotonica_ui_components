import 'dart:async';

import 'package:annotations/annotations.dart';
import 'package:example/example.dart';
import 'package:flutter/material.dart';
import 'package:fotonica_ui_components/fotonica_button.dart';

part 'buttons_examples.g.dart';

@generateCodeSnapshot
class ButtonsExamples extends Example {
  get code {
    return sourceCode;
  }

  @override
  State<StatefulWidget> createState() {
    return ButtonsExamplesState();
  }
}

class ButtonsExamplesState extends State<ButtonsExamples> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Simple button"),
        FotonicaButton(
            label: "Toque aqui",
            onPressed: () async {
              // simulate a request
              return Future.delayed(Duration(seconds: 2));
            }),
        SizedBox(
          height: 16,
        ),
        Text("Button with icon"),
        FotonicaButton(
            color: Theme.of(context).primaryColor,
            labelColor: Colors.white,
            icon: Icon(Icons.house, color: Colors.white,),
            label: "Toque aqui",
            onPressed: () async {
              // simulate a request
              return Future.delayed(Duration(seconds: 2));
            })
      ],
    );
  }
}
