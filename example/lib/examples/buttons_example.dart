
import 'dart:async';
import 'dart:io';

import 'package:annotations/annotations.dart';
import 'package:example/example.dart';
import 'package:flutter/material.dart';
import 'package:fotonica_ui_components/fotonica_elevated_button.dart';

part 'buttons_example.g.dart';

@generateCodeSnapshot
class ButtonsExample extends Example {

  @override
  State<StatefulWidget> createState() {
    return ButtonsExampleState();
  }
}

class ButtonsExampleState extends State<ButtonsExample>{

  @override
  Widget build(BuildContext context) {

    return ListView(
      shrinkWrap: true,
      children: [
        FotonicaElevatedButton(label: "Label", onPressed: () async {
          // simulate a request
          return Future.delayed(Duration(seconds: 2));
        }),
      ],
    );
  }
}