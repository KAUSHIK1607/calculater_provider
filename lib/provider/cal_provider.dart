import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalculaterProvider extends ChangeNotifier {
  final calcuControlled = TextEditingController();

  setValue(String value) {
    String stg = calcuControlled.text;
    switch (value) {
      case "C":
        calcuControlled.clear();

        break;
      case "AC":
        calcuControlled.text = stg.substring(0, stg.length - 1);
      case "=":
        Ans();
        break;
      default:
        calcuControlled.text += value;
    }

    calcuControlled.selection = TextSelection.fromPosition(
        TextPosition(offset: calcuControlled.text.length));
  }

  Ans() {
    String text = calcuControlled.text;
    calcuControlled.text = text.interpret().toString();
  }
}
