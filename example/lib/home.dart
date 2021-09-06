import 'package:example/doc_item.dart';
import 'package:example/examples/address_examples.dart';
import 'package:example/examples/auth_examples.dart';
import 'package:example/examples/buttons_examples.dart';
import 'package:example/examples/dialog_examples.dart';
import 'package:example/examples/form_examples.dart';
import 'package:example/examples/snackbar_examples.dart';
import 'package:example/examples/text_field_examples.dart';
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
  List<DocItem> docItems = [
    DocItem(
        icon: Icon(Icons.smart_button),
        name: "Buttons",
        example: ButtonsExamples()),
    DocItem(
        icon: Icon(Icons.text_fields),
        name: "Text Fields",
        example: TextFieldExamples()),
    DocItem(
        icon: Icon(Icons.format_indent_increase_sharp),
        name: "Forms",
        example: FormExamples()),
    DocItem(
        icon: Icon(Icons.comment_sharp),
        name: "Snackbars",
        example: SnackbarExamples()),
    DocItem(
        icon: Icon(Icons.perm_media_outlined),
        name: "Dialog",
        example: DialogExamples()),
    DocItem(
        icon: Icon(Icons.auto_fix_high_sharp),
        name: "Login",
        example: AuthExamples()),
    DocItem(
        icon: Icon(Icons.location_on_outlined),
        name: "Address",
        example: AddressExamples())
  ];

  late DocItem currentDocItem;

  @override
  void initState() {
    super.initState();
    currentDocItem = docItems.first;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Fotonica UI Components"),
      ),
      body: Row(
        children: [
          Container(
            width: size.width * .2,
            height: size.height,
            child: Drawer(
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  DocItem item = docItems[i];
                  return ListTile(
                    leading: item.icon,
                    title: Text(item.name),
                    onTap: () {
                      setState(() {
                        currentDocItem = item;
                      });
                    },
                  );
                },
                itemCount: docItems.length,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                Playground(
                  code: currentDocItem.example.code,
                  preview: currentDocItem.example,
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
