import 'package:flutter/material.dart';

class MaterialButtonWidget {
  MaterialButton createButton(
      Color buttonColor, Widget buttonChild, Function buttonOnPressed) {
    return MaterialButton(
      color: buttonColor,
      child: buttonChild,
      onPressed: buttonOnPressed,
    );
  }
}
