import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

abstract class IPhotoBloc with ChangeNotifier {
  Future<File> getPictureFromGallery();
  Future<File> getPictureFromCamera();
}

class PhotoBloc with ChangeNotifier implements IPhotoBloc {
  @override
  Future<File> getPictureFromCamera() async {
    try {
      return await ImagePicker.pickImage(source: ImageSource.camera);
    } on PlatformException catch (e) {
      debugPrint(e.message);
      return null;
    }
  }

  @override
  Future<File> getPictureFromGallery() async {
    try {
      return await ImagePicker.pickImage(source: ImageSource.gallery);
    } on PlatformException catch (e) {
      debugPrint(e.message);
      return null;
    }
  }
}
