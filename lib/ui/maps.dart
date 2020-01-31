import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:planet_cleaner/bloc/map_bloc.dart';
import 'package:planet_cleaner/utils/app_color.dart';
import 'package:provider/provider.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller = Completer();
  MapType _currentMapType = MapType.normal;
  IMapBloc _googleMapBloc;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    _googleMapBloc = Provider.of<IMapBloc>(context);
    return Stack(
      children: <Widget>[
        FutureBuilder(
            future: _googleMapBloc.getCurrentUserPosition(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError || snapshot.data == null)
                return Center(child: const CircularProgressIndicator());
              else
                return GoogleMap(
                  markers: _googleMapBloc.getPollutedLocations(),
                  mapType: _currentMapType,
                  initialCameraPosition: CameraPosition(
                    target: snapshot.data,
                    zoom: 11,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                );
            }),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget>[
                FloatingActionButton(
                  onPressed: _onMapTypeButtonPressed,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: AppColor.lightGreen,
                  child: const Icon(
                    Icons.cached,
                    color: AppColor.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
