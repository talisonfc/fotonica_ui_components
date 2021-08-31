import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleDialogActions<T> extends StatelessWidget {
  final T value;

  SimpleDialogActions({required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SimpleDialogOption(
          padding: EdgeInsets.all(16),
          child: Text("Cancelar"),
          onPressed: () {
            Navigator.pop(context, null);
          },
        ),
        SimpleDialogOption(
          padding: EdgeInsets.all(16),
          child: Text("Salvar"),
          onPressed: () {
            Navigator.pop(context, value != null ? value : true);
          },
        )
      ],
    );
  }
}
