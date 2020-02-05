import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:planet_cleaner/datamodels/pollution_report_model.dart';

abstract class IMapBloc with ChangeNotifier {
  Future<LatLng> getCurrentUserPosition();

  Set<Marker> getPollutedLocations();

  void addNewPolutionMarker(PollutionReportModel report);
}

class MapGoogleBloc with ChangeNotifier implements IMapBloc {
  MapGoogleBloc() {
    _listOfMarkers = {};
  }

  Set<Marker> _listOfMarkers;

  @override
  void addNewPolutionMarker(PollutionReportModel pollution) {
    _listOfMarkers.add(Marker(
      markerId: MarkerId(pollution.position.hashCode.toString()),
      position: pollution.position,
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: pollution.type, snippet: pollution.hashtag),
    ));
  }

  @override
  Future<LatLng> getCurrentUserPosition() async {
    LocationData userPosition;

    try {
      userPosition = await Location().getLocation();
      if (userPosition != null) {
        return LatLng(userPosition.latitude, userPosition.longitude);
      }
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint('Permission denied');
        return null;
      }
    }
    return null;
  }

  @override
  Set<Marker> getPollutedLocations() {
    return _listOfMarkers;
  }

  Set<Marker> get listOfMarkers => _listOfMarkers;
}
