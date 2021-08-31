

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class FotonicaColorPicker extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FotonicaColorPickerState();
  }
}

class FotonicaColorPickerState extends State<FotonicaColorPicker>{

  Color pickerColor = Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: pickerColor,
          title: Text("Color Picker"),
          actions: [
            IconButton(icon: Icon(Icons.check), onPressed: (){
              Navigator.pop(context, pickerColor);
            })
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: "ColorPicker",
              ),
              Tab(
                text: "MaterialPicker",
              ),
              Tab(
                text: "BlockPicker",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
            MaterialPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
              // showLabel: true, // only on portrait mode
            ),
            BlockPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
            )
          ],
        ),
      ),
    );
  }
}