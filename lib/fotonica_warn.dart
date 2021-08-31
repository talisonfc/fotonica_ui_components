import 'package:flutter/material.dart';

enum WarnType { success, error, info }

class FotonicaWarn extends StatelessWidget {
  final String message;
  final WarnType type;

  FotonicaWarn({required this.message, this.type = WarnType.success});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: type == WarnType.error
              ? Theme.of(context).errorColor.withOpacity(.7)
              : Theme.of(context).primaryColor.withOpacity(.7),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(message,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.white)),
      ),
    );
  }
}
