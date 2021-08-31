import 'package:flutter/material.dart';

class InputNumber extends StatelessWidget {
  final int value;
  final int min;
  final Function(int value) onChange;
  final double btnRadius;

  InputNumber(
      {this.value = 1,
      this.min = 0,
      required this.onChange,
      this.btnRadius = 16});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Card(
        color: Theme.of(context).secondaryHeaderColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Wrap(
          children: [
            MaterialButton(
              onPressed: () {
                if ((this.value - 1) > min) {
                  this.onChange(this.value - 1);
                }
              },
              color: Colors.white,
              minWidth: 0,
              padding: EdgeInsets.all(btnRadius),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
              child: Icon(Icons.remove),
            ),
            Container(
              child: Text(
                this.value.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 20),
              ),
              padding: EdgeInsets.all(btnRadius),
            ),
            MaterialButton(
              onPressed: () {
                this.onChange(this.value + 1);
              },
              color: Colors.white,
              minWidth: 0,
              padding: EdgeInsets.all(btnRadius),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
