import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FotonicaSnackbar {
  static void success(
      {required BuildContext context,
      required Widget content,
      Function? onClose}) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
        action: SnackBarAction(
          label: "Fechar",
          textColor: Theme.of(context).primaryColorLight,
          onPressed: () {
            if (onClose != null) onClose();
          },
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        duration: Duration(seconds: 2),
        content: content));
  }

  static void erro(
      {required BuildContext context,
      required Widget content,
      Function? onClose}) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        backgroundColor: Theme.of(context).errorColor,
        action: SnackBarAction(
          label: "Fechar",
          textColor: Theme.of(context).primaryColorLight,
          onPressed: () {
            if (onClose != null) onClose();
          },
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        duration: Duration(seconds: 2),
        content: content));
  }
}
