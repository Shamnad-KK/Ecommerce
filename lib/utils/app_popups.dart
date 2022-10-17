import 'package:flutter/animation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppPopUps {
  static Future<void> showToast(
    String msg,
    Color color, [
    Toast toastLength = Toast.LENGTH_SHORT,
  ]) async {
    await Fluttertoast.cancel();
    await Fluttertoast.showToast(
      msg: msg,
      backgroundColor: color,
      toastLength: toastLength,
    );
  }
}
