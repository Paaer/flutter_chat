import 'package:location/location.dart';

class LocationService {
  Future<LocationData?> getLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    // Har vi adgang til GPS enheden?
    _serviceEnabled = await location.serviceEnabled();

    // Hvis ikke, så spørg pænt om vi må få adgang
    // og hvis ikke, så gå slukøret hjem :)
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    // Her er serviceEnabled true, så HURRA🐹 vi kan spørge på location
    // MEN først skal vi have lov
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }
}
