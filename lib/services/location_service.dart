import 'package:location/location.dart';
import 'package:planet_cleaner/datamodels/user_location.dart';

abstract class ILocationService {
  Future<UserLocation> getLocation();
}

class LocationService implements ILocationService {
  LocationService() {
    location = Location();
    location.requestPermission().then((granted) {
      if (granted) {
        location.onLocationChanged().listen((locationData) {
          if (locationData != null) {
            getLocation();
          }
        });
      }
    });
  }

  Location location;

  UserLocation _currentLocation;

  @override
  Future<UserLocation> getLocation() async {
    try {
      final userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longtitude: userLocation.longitude,
      );
    } on Exception catch (e) {
      print('Could not get the location $e');
    }

    return _currentLocation;
  }
}
