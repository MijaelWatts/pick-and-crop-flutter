import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class FileImg {
  File _selectedFile;
  ImagePicker _imagePicker = ImagePicker();
  final String _defaultImgAsset = 'assets/placeholder.png';
  final double _defaultImgWidth = 250;
  final double _defaultImgHeight = 250;

  getImage(ImageSource source) async {
    File croppedImg;
    final pickedFile = await _imagePicker.getImage(source: source);

    if (pickedFile.path != null) {
      croppedImg = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 700,
        maxHeight: 700,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarColor: Colors.deepOrange,
          toolbarTitle: "RPS Cropper",
          statusBarColor: Colors.deepOrange.shade900,
          backgroundColor: Colors.white,
        ),
      );
    }

    return croppedImg;
  }

  Image getImageWidget() {
    if (_selectedFile != null) {
      return Image.file(
        _selectedFile,
        width: _defaultImgWidth,
        height: _defaultImgHeight,
      );
    } else {
      return Image.asset(
        _defaultImgAsset,
        width: _defaultImgWidth,
        height: _defaultImgHeight,
      );
    }
  }

  void setSelectedFile(File selectedFile) {
    if (selectedFile != null) {
      this._selectedFile = selectedFile;
    }
  }
}
