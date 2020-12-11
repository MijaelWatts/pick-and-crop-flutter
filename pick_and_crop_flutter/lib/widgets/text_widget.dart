import 'package:flutter/material.dart';

class TextWidget {
  Text createTextWidget(String text, Color textColor) {
    return Text(
      text,
      style: TextStyle(color: textColor),
    );
  }
}
