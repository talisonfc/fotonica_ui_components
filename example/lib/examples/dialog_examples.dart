import 'package:annotations/annotations.dart';
import 'package:example/example.dart';
import 'package:flutter/material.dart';
import 'package:fotonica_ui_components/simple_dialog_actions.dart';

part 'dialog_examples.g.dart';

@generateCodeSnapshot
class DialogExamples extends Example {
  @override
  get code => sourceCode;

  @override
  State<StatefulWidget> createState() {
    return DialogExamplesState();
  }
}

class DialogExamplesState extends State<DialogExamples> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [ElevatedButton(onPressed: () {
        showDialog(context: context, builder: (ctx){
          return SimpleDialog(
            title: Text("Title"),
            children: [
              SimpleDialogActions(value: true)
            ],
          );
        });
      }, child: Text("Open dialog"))],
    );
  }
}
