import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import 'package:planet_cleaner/utils/app_color.dart';
import 'package:image_picker/image_picker.dart';

class CameraTestWidget extends StatefulWidget {
  @override
  _CameraTestWidgetState createState() => _CameraTestWidgetState();
}

class _CameraTestWidgetState extends State<CameraTestWidget> {

  File imageFile;

  _openGallery() async{
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState((){
      imageFile = picture;
    });
  }

  _openCamera()async{
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    setState((){
      imageFile = picture;
    });
  }

  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Make a choice"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Gallery"),
                onTap: (){
                  _openGallery();
                } ,
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                child: Text("Camera"),
                onTap: (){
                  _openCamera();
                } ,
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var firstColor = Colors.lightBlueAccent, secondColor = Colors.lightGreen;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("Make a photo\nor pick an image",
                  style: Theme.of(context).primaryTextTheme.display3,
                  textAlign: TextAlign.center),
              NiceButton(
                radius: 30,
                padding: const EdgeInsets.all(15),
                text: "Select Image!",
                background: AppColor.white,
                gradientColors: [firstColor, secondColor],
                onPressed: (){
                 _showChoiceDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
