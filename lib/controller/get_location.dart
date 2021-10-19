import 'package:geolocator/geolocator.dart';

class GetLocation {
  double latitude = 0;
  double longitude = 0;

  Future<void> getCurrenctLocation() async {
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    latitude = currentPosition.latitude;
    longitude = currentPosition.longitude;
  }
}
