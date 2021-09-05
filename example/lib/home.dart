import 'package:annotations/annotations.dart';
import 'package:example/example.dart';
import 'package:example/examples/buttons_example.dart';
import 'package:example/playground.dart';
import 'package:flutter/material.dart';
import 'package:fotonica_ui_components/fotonica_text_field.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {

  late Example current;

  Map<String, Example> previews = {
    "buttons": ButtonsExample()
  };

  @override
  void initState() {
    super.initState();
    current = previews.values.first;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Doc"),
      ),
      body: Row(
        children: [
          Container(
            width: size.width * .2,
            height: size.height,
            child: Drawer(
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  return ListTile(
                    title: Text("item $i"),
                  );
                },
                itemCount: 40,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                Playground(
                  code: ButtonsExampleSourceCode().sourceCode,
                  preview: ButtonsExample(),
                )
              ],
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Documentation"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Container(
          //     decoration: BoxDecoration(color: Colors.black),
          //     child: Text(
          //       homeGen.sourceCode,
          //       style: TextStyle(color: Colors.white),
          //     )),
          // FotonicaTextField(
          //     controller: TextEditingController(text: homeGen.sourceCode),
          //     maxLines: 10,
          //     filled: false,
          //     onChange: (v) {}),
          Wrap(
            children: [
              Text("FotonicaTextField"),
              FotonicaTextField(
                  label: "Label",
                  placeholder: "Placeholder",
                  controller: TextEditingController(),
                  onChange: (v) {})
            ],
          ),
          FotonicaTextField(
              label: "Label",
              prefixIcon: Icon(Icons.search),
              placeholder: "Placeholder",
              controller: TextEditingController(),
              onChange: (v) {})
        ],
      ),
    );
  }
}
