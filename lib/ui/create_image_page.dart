import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planet_cleaner/bloc/backend_bloc.dart';
import 'package:planet_cleaner/bloc/camera_bloc.dart';
import 'package:planet_cleaner/bloc/map_bloc.dart';
import 'package:planet_cleaner/datamodels/pollution_report_model.dart';
import 'package:planet_cleaner/utils/app_color.dart';
import 'package:provider/provider.dart';

import 'widgets/button_planet.dart';

class CreateImageView extends StatefulWidget {
  @override
  _CreateImageViewState createState() => _CreateImageViewState();
}

class _CreateImageViewState extends State<CreateImageView> {
  IBackendBloc backendBloc;
  final TextEditingController hashTagController = TextEditingController();
  File imageFile;
  IMapBloc mapBloc;
  IPhotoBloc photoBloc;

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
                      photoBloc
                          .getPictureFromGallery()
                          .then((File returnedPic) {
                        setState(() {
                          imageFile = returnedPic;
                        });
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                  const Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: const Text('Camera'),
                    onTap: () {
                      photoBloc.getPictureFromCamera().then((File returnedPic) {
                        setState(() {
                          imageFile = returnedPic;
                        });
                      });
                      Navigator.of(context).pop();
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
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Image.file(
          imageFile,
          width: 300,
          height: 200,
        ),
      ),
      Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: TextFormField(
                controller: hashTagController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    FontAwesomeIcons.hashtag,
                    color: AppColor.yellow,
                  ),
                  hintText: 'Enter hashtags',
                  hintStyle: TextStyle(color: AppColor.darkGreen),
                  labelText: 'Hashtags',
                  labelStyle: TextStyle(color: AppColor.darkGreen),
                ),
                cursorColor: AppColor.yellow,
                keyboardType: TextInputType.text,
                style: TextStyle(color: AppColor.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: AppColor.darkGreen,
                ),
                child: DropdownButton<String>(
                  iconSize: 40,
                  isExpanded: true,
                  isDense: true,
                  underline: const SizedBox(),
                  iconEnabledColor: AppColor.yellow,
                  items: _pollutions.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: Theme.of(context).primaryTextTheme.display2,
                      ),
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ButtonPlanet(
                'Send',
                () async {
                  final repPollut = PollutionReportModel(
                    _currentItemSelected,
                    hashTagController.text,
                    imageFile,
                    await mapBloc.getCurrentUserPosition(),
                  );

                  print('${hashTagController.text} and $_currentItemSelected');

                  setState(() {
                    // TODO(vera): implement sending to instagram
                    imageFile = null;
                    hashTagController.text = '';
                  });

                  if (await backendBloc.sendPhotoWithDataToBackend(repPollut)) {
                    mapBloc.addNewPolutionMarker(repPollut);
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content:
                            const Text('Thank you for sending the request!'),
                        backgroundColor: AppColor.yellow,
                        duration: Duration(seconds: 3),
                      ),
                    );
                  } else {
                    print('Failed sending request!');
                  }
                },
              ),
            )
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    photoBloc = Provider.of<IPhotoBloc>(context);
    backendBloc = Provider.of<IBackendBloc>(context);
    mapBloc = Provider.of<IMapBloc>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: imageFile == null ? makePhotoView() : sendRequestView(),
          ),
        ),
      ),
    );
  }
}
