import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
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
          if (showCode) Text(widget.code),
          if (!showCode) widget.preview
        ],
      ),
    );
  }
}
