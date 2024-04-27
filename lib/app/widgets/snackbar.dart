import 'package:flutter/material.dart';

void showSnackBarWidget(
  BuildContext context,
  String text,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: const Duration(milliseconds: 3000),
      action: SnackBarAction(
        label: "Ok",
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}
