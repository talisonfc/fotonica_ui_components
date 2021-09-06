// import 'package:code_editor/code_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class Playground extends StatefulWidget {
  final String code;
  final Widget preview;

  Playground({required this.code, required this.preview});

  @override
  State<StatefulWidget> createState() {
    return PlaygroundState();
  }
}

class PlaygroundState extends State<Playground> {
  bool showCode = false;

  // List<FileEditor> get files => [
  //   new FileEditor(
  //     name: "widget1.dart",
  //     language: "dart",
  //     code: widget.code, // [code] needs a string
  //   ),
  //   new FileEditor(
  //     name: "widget2.dart",
  //     language: "dart",
  //     code: widget.code, // [code] needs a string
  //   )
  // ];
  //
  // EditorModel get model => new EditorModel(
  //   files: files, // the files created above
  //   // you can customize the editor as you want
  //   styleOptions: new EditorModelStyleOptions(
  //     fontSize: 13,
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: ListView(
        padding: EdgeInsets.all(16),
        primary: false,
        shrinkWrap: true,
        children: [
          Wrap(
            children: [
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    showCode = false;
                  });
                },
                label: Text("Preview"),
                icon: Icon(Icons.preview),
              ),
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    showCode = true;
                  });
                },
                label: Text("Code"),
                icon: Icon(Icons.code),
              ),
            ],
          ),
          Divider(),
          if (showCode)
            HighlightView(
              widget.code,
              language: 'dart',
              theme: githubTheme,
              padding: EdgeInsets.all(12),
              textStyle: TextStyle(
                // fontFamily: 'monospace',
                fontSize: 16,
              ),
            ),
          // if(showCode) CodeEditor(
          //   model: model, // the model created above, not required since 1.0.0
          //   edit: true, // can edit the files ? by default true
          //   disableNavigationbar: false, // hide the navigation bar ? by default false
          //   // onSubmit: (String language, String value) {}, // when the user confirms changes in one of the files
          //   textEditingController: TextEditingController(text: "Hello"), // Provide an optional, custom TextEditingController.
          // ),
          if (!showCode) widget.preview
        ],
      ),
    );
  }
}
