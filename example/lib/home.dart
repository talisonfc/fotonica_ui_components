import 'package:example/doc_item.dart';
import 'package:example/examples/address_examples.dart';
import 'package:example/examples/animation/animated_switcher_example.dart';
import 'package:example/examples/auth_examples.dart';
import 'package:example/examples/buttons_examples.dart';
import 'package:example/examples/dialog_examples.dart';
import 'package:example/examples/form_examples.dart';
import 'package:example/examples/snackbar_examples.dart';
import 'package:example/examples/text_field_examples.dart';
import 'package:example/playground.dart';
import 'package:flutter/material.dart';
import 'package:fotonica_ui_components/fotonica_button.dart';

class Home extends StatefulWidget {
  final Function(ThemeMode mode) onChangeThemeMode;
  final ThemeMode themeMode;

  Home({required this.onChangeThemeMode, required this.themeMode});

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
        example: AddressExamples()),
    // DocItem(
    //     icon: Icon(Icons.location_on_outlined),
    //     name: "AnimatedSwitcher",
    //     example: AnimatedSwitcherExample())
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
        actions: [
          FotonicaButton(onPressed: ()async{}, label: "Dark Mode",),
          Switch(
            value: widget.themeMode == ThemeMode.dark,
            onChanged: (v) {
              widget.onChangeThemeMode(v ? ThemeMode.dark : ThemeMode.light);
            },
          )
        ],
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
  }
}
