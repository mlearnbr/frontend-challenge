import 'package:flutter/material.dart';

import '../constants/globals.dart';

void showSnackBarFailure({
  String? message,
}) {
  snackbarKey.currentState?.showSnackBar(SnackBar(
    backgroundColor: Colors.black87,
    content: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        message ?? 'Something went wrong',
      ),
    ),
  ));
}
