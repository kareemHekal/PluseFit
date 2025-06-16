import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum TybeMessage {
  positive,
  negative,
}

// ================    Usage    ================\\

///          if (state.isSent) {
///             toastMessage(
///                 message: "The Code has been sent. Check your email.",
///                 tybeMessage: TybeMessage.positive);
///           }

// ================    Usage    ================\\

void toastMessage({required String message, required TybeMessage tybeMessage}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor:
          tybeMessage == TybeMessage.positive ? Colors.green : Colors.red,
      webBgColor: tybeMessage == TybeMessage.positive
          ? "linear-gradient(to right, #00FF00, #00AA00)"
          : "linear-gradient(to right, #FF0000, #AA0000)",
      textColor: Colors.white,
      fontSize: 16.0);
}
