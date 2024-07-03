import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> ScafoldSnakBar(
    BuildContext context,
    {required String msg}) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(msg)));
}
