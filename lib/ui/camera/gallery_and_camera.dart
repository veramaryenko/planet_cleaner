import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nice_button/nice_button.dart';
import 'package:planet_cleaner/utils/app_color.dart';
import 'package:image_picker/image_picker.dart';


class CameraTestWidget extends StatefulWidget {
  @override
  _CameraTestWidgetState createState() => _CameraTestWidgetState();
}

class _CameraTestWidgetState extends State<CameraTestWidget> {
  File imageFile;

  String _currentItemSelected = 'soil pollution';
  var _pollutians = ['air pollution','water pollution','soil pollution','light pollution'];


  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Make a choice"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }


  final _formKey = GlobalKey<FormState>();
  Widget _decideImageView() {

    final GlobalKey<FormState> _formkeyValue = new GlobalKey<FormState>();


    if (imageFile == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("Make a photo\nor pick an image",
                style: Theme.of(context).primaryTextTheme.display3,
                textAlign: TextAlign.center),
            Icon(
              FontAwesomeIcons.child,
              color: Colors.lightGreenAccent,
              size: 180,
            ),
            NiceButton(
              radius: 20,
              padding: const EdgeInsets.all(15),
              text: "Select Image!",
              background: AppColor.white,
              gradientColors: [Colors.lightBlueAccent, Colors.lightGreen],
              onPressed: () {
                _showChoiceDialog(context);
              },
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.file(
              imageFile,
              width: 300,
              height: 200,
            ),
            Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 1.0),
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(FontAwesomeIcons.hashtag),
                      hintText: "Enter hashtags",
                      labelText: "Hashtags",
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: <Widget>[
                      DropdownButton<String>(
                        items: _pollutians.map((String dropDownStringItem ){
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (String newValueSelected){
                          setState(() {
                            this._currentItemSelected = newValueSelected;
                          });
                        },
                        value: _currentItemSelected,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            NiceButton(
              radius: 30,
              width:100 ,
              padding: const EdgeInsets.all(5),
              text: "Send",
              background: AppColor.white,
              gradientColors: [Colors.lightBlueAccent, Colors.lightGreen],
              onPressed: () {
                Firestore.instance
                    .collection('tasks')
                    .add({
                  "title": "title",
                  "description": "description"
                })
                    .then((result) => { Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Thank you for sending the request! "),
                backgroundColor: Colors.lightGreen,
                duration: Duration(seconds: 5), ),
                )}
                )
                    .catchError((err) => print(err));;
                //TODO implement sending to instagram
              },
            ),
          ],
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        padding: const EdgeInsets.only(bottom: 5, top: 5),
        child: _decideImageView(),
      ),
    );
  }
}
