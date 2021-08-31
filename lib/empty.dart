import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  final String message;
  final Widget? child;
  final Widget icon;

  Empty(
      {Key key = const Key("Empty"),
      required this.message,
      this.child,
      this.icon = const Icon(
        Icons.hourglass_empty,
        size: 100,
        color: Colors.grey,
      )})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          icon,
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              this.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey),
            ),
          ),
          if (child != null) child!
        ],
      ),
    );
  }
}
