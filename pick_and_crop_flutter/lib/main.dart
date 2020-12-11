import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'widgets/text_widget.dart';
import 'widgets/app_bar_widget.dart';
import 'widgets/app_row_widget.dart';
import 'widgets/material_button_widget.dart';

import 'file_img.dart';

TextWidget textWidget = TextWidget();
AppBarWidget appBarWidget = AppBarWidget();
AppRowWidget appRowWidget = AppRowWidget();
MaterialButtonWidget materialButtonWidget = MaterialButtonWidget();

FileImg fileImage = FileImg();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pick & Crop Flutter App',
      home: PickAndCropApp(),
    );
  }
}

class PickAndCropApp extends StatefulWidget {
  @override
  _MyPickAndCropAppState createState() => _MyPickAndCropAppState();
}

class _MyPickAndCropAppState extends State<PickAndCropApp> {
  _getImage(ImageSource source) async {
    File croppedFile = await fileImage.getImage(source);

    if (croppedFile != null) {
      this.setState(() {
        fileImage.setSelectedFile(croppedFile);
      });
    } else {
      // TODO: box saying something went wrong.
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _camAndDeviceList = [
      materialButtonWidget.createButton(
        Colors.green,
        textWidget.createTextWidget('Camera', Colors.white),
        () {
          _getImage(ImageSource.camera);
        },
      ),
      materialButtonWidget.createButton(
        Colors.purple,
        textWidget.createTextWidget('Device', Colors.white),
        () {
          _getImage(ImageSource.gallery);
        },
      ),
    ];

    return Scaffold(
      appBar: appBarWidget.createAppBar(
          Colors.orange.shade600, true, 'Pick & Crop'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          fileImage.getImageWidget(),
          appRowWidget.createRow(
              MainAxisAlignment.spaceEvenly, _camAndDeviceList),
        ],
      ),
    );
  }
}
