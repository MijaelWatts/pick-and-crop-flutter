import 'package:flutter/material.dart';

class AppBarWidget {
  AppBar createAppBar(Color barColor, bool barCentered, String barTitle) {
    return AppBar(
      backgroundColor: barColor,
      centerTitle: barCentered,
      title: Text(barTitle),
    );
  }
}
