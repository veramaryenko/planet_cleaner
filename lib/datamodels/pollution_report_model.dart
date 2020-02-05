import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class PollutionReportModel {
  PollutionReportModel(this.type, this.hashtag, this.picture, this.position);

  final String hashtag;
  final File picture;
  final LatLng position;
  final String type;
}
