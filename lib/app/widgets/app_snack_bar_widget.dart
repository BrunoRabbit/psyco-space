import 'package:flutter/material.dart';

class AppSnackBarWidget {
  static SnackBar showSuccessSnackBar(String message) {
    return SnackBar(
        content: Row(
      children: [
        const Icon(
          Icons.check_circle_rounded,
          color: Colors.greenAccent,
        ),
        Text(message),
      ],
    ));
  }

  static SnackBar showErrorSnackBar(String message) {
    return SnackBar(
        content: Row(
      children: [
        const Icon(
          Icons.error,
          color: Colors.redAccent,
        ),
        Text(message),
      ],
    ));
  }
}
