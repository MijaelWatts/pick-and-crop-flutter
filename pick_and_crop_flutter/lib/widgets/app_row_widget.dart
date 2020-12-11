import 'package:flutter/material.dart';

class AppRowWidget {
  Row createRow(MainAxisAlignment rowAxis, List<Widget> rowChildren) {
    return Row(
      mainAxisAlignment: rowAxis,
      children: rowChildren,
    );
  }
}
