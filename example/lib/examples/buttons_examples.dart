
import 'dart:async';
import 'dart:io';

import 'package:annotations/annotations.dart';
import 'package:example/example.dart';
import 'package:flutter/material.dart';
import 'package:fotonica_ui_components/fotonica_elevated_button.dart';

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

class ButtonsExamplesState extends State<ButtonsExamples>{

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        FotonicaElevatedButton(label: "Toque aqui", onPressed: () async {
          // simulate a request
          return Future.delayed(Duration(seconds: 2));
        }),
        FotonicaElevatedButton(
          color: Theme.of(context).primaryColor,
            labelColor: Colors.white,
            icon: Icon(Icons.house),
            label: "Toque aqui", onPressed: () async {
          // simulate a request
          return Future.delayed(Duration(seconds: 2));
        }),
      ],
    );
  }
}