import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planet_cleaner/datamodels/pollution_report_model.dart';

abstract class IBackendBloc with ChangeNotifier {
  Future<bool> sendPhotoWithDataToBackend(PollutionReportModel report);
}

class BackendBloc with ChangeNotifier implements IBackendBloc {
  @override
  Future<bool> sendPhotoWithDataToBackend(PollutionReportModel report) async {
    Future<bool> isSendedWithSuccess = Future.value(false);

    try {
      Firestore.instance
          .collection('pollution')
          .document('1')
          .setData({'title': 'pollutions', 'description': report.type});

      final DocumentReference ref = await Firestore.instance
          .collection('types')
          .add({
        'title': report.hashtag,
        'description': report.position.toString()
      });
      print(ref.documentID);
      isSendedWithSuccess = Future.value(true);
    } on Exception catch (e) {
      debugPrint(e.toString());
      isSendedWithSuccess = Future.value(false);
    }

    return isSendedWithSuccess;
  }
}
