import 'package:location/location.dart';
import 'package:planet_cleaner/datamodels/user_location.dart';

class LocationService {
  LocationService() {
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

  var location = Location();

  UserLocation _currentLocation;

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
