import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showError(String message,
      {TextStyle textStyle = const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white)}) {
    showTopSnackBar(
      Overlay.of(context),
      displayDuration: const Duration(seconds: 3),
      CustomSnackBar.error(
        maxLines: 4,
        message: message,
        backgroundColor: Colors.lightBlueAccent,
        textStyle: textStyle,
      ),
    );
  }

  void showSuccess(String message,
      {TextStyle textStyle = const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
      Duration duration = const Duration(seconds: 3)}) {
    showTopSnackBar(
      displayDuration: duration,
      Overlay.of(context),
      CustomSnackBar.success(
        maxLines: 4,
        message: message,
        textStyle: textStyle,
      ),
    );
  }

  void showBottomError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(message),
      duration: const Duration(seconds: 1),
    ));
  }
}
