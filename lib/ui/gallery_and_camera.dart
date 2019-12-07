import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nice_button/nice_button.dart';
import 'package:planet_cleaner/utils/app_color.dart';
import 'package:image_picker/image_picker.dart';

import 'widgets/button_planet.dart';

class CameraWidget extends StatefulWidget {
  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  final TextEditingController hashTagController = TextEditingController();
  File imageFile;

  String _currentItemSelected;
  final _formKey = GlobalKey<FormState>();
  final List<String> _pollutions = [
    'air pollution',
    'water pollution',
    'soil pollution',
    'light pollution'
  ];

  @override
  void initState() {
    super.initState();
    _currentItemSelected = _pollutions[2];
  }

  Future<void> _openGallery(BuildContext context) async {
    final File picture =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _openCamera(BuildContext context) async {
    try {
      final File picture =
          await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        imageFile = picture;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      debugPrint('camera is busy, ignoring request');
    }
  }

  void _showChoiceDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Make a choice'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: const Text('Gallery'),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  const Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: const Text('Camera'),
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

  List<Widget> makePhotoView() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text('Make a photo or pick an image',
            style: Theme.of(context).primaryTextTheme.display3,
            textAlign: TextAlign.center),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Icon(FontAwesomeIcons.child, color: AppColor.yellow, size: 180),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: ButtonPlanet('Select Image!', _showChoiceDialog),
      ),
    ];
  }

  List<Widget> sendRequestView() {
    return [
      Image.file(
        imageFile,
        width: 300,
        height: 200,
      ),
      Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: TextFormField(
                controller: hashTagController,
                style: Theme.of(context).primaryTextTheme.display2,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(FontAwesomeIcons.hashtag),
                  hintText: 'Enter hashtags',
                  labelText: 'Hashtags',
                ),
                cursorColor: AppColor.white,
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: DropdownButton<String>(
                isExpanded: true,
                isDense: true,
                underline: const SizedBox(),
                items: _pollutions.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String newValueSelected) {
                  setState(() {
                    _currentItemSelected = newValueSelected;
                  });
                },
                value: _currentItemSelected,
              ),
            ),
          ],
        ),
      ),
      NiceButton(
        radius: 20,
        padding: const EdgeInsets.all(15),
        text: 'Send',
        background: AppColor.white,
        gradientColors: [Colors.lightBlueAccent, Colors.lightGreen],
        onPressed: () {
          print('${hashTagController.text} and $_currentItemSelected');
          setState(() {
            imageFile = null;
          });
          //TODO implement sending to instagram
        },
      ),
    ];
  }

  void sendRequest() {
    Firestore.instance
        .collection('tasks')
        .add({"title": "title", "description": "description"})
        .then((result) => {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Thank you for sending the request! "),
                  backgroundColor: Colors.lightGreen,
                  duration: Duration(seconds: 5),
                ),
              )
            })
        .catchError((err) => print(err));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: imageFile == null ? makePhotoView() : sendRequestView(),
        ),
      ),
    );
  }
}
