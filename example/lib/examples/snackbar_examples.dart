import 'package:annotations/annotations.dart';
import 'package:example/example.dart';
import 'package:flutter/material.dart';
import 'package:fotonica_ui_components/util/fotonica_snackbar.dart';

part 'snackbar_examples.g.dart';

@generateCodeSnapshot
class SnackbarExamples extends Example {
  @override
  State<StatefulWidget> createState() {
    return SnackbarExamplesState();
  }

  @override
  get code => sourceCode;
}

class SnackbarExamplesState extends State<SnackbarExamples> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text("Click on button to show snackbar"),
        SizedBox(height: 16,),
        ElevatedButton(
            onPressed: () {
              FotonicaSnackbar.success(
                  context: context, content: Text("Mensagem de sucesso"));
            },
            child: Text("Show Snackbar Sucess")),
        SizedBox(height: 16,),
        ElevatedButton(
            onPressed: () {
              FotonicaSnackbar.erro(
                  context: context, content: Text("Mensagem de error"));
            },
            child: Text("Show Snackbar Error"))
      ],
    );
  }
}
