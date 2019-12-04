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

  _openGallery(BuildContext context) async{
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState((){
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context)async{
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    setState((){
      imageFile = picture;
    });
    Navigator.of(context).pop();
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
                  _openGallery(context);
                } ,
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                child: Text("Camera"),
                onTap: (){
                  _openCamera(context);
                } ,
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _decideImageView(){
    int selectedIndex = 0;

    if(imageFile == null){
      return
        Text("Make a photo\nor pick an image",
          style: Theme.of(context).primaryTextTheme.display3,
          textAlign: TextAlign.center);
    }else{
      return
      Image.file(imageFile, width: 600, height: 800,);
    }
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
              _decideImageView(),
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
