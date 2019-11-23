import 'package:location/location.dart';
import 'package:planet_cleaner/datamodels/user_location.dart';

class LocationService {
  UserLocation _currentLocation;

  var location = Location();

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

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longtitude: userLocation.longitude,
      );
    } catch (e) {
      print('Could not get the location $e');
    }

    return _currentLocation;
  }
}
