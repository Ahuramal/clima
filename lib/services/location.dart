import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  getCurrentLocation() async {
    try {
      LocationPermission permission =
          await Geolocator.checkPermission() == LocationPermission.denied
              ? await Geolocator.requestPermission()
              : await Geolocator.checkPermission();
      if (permission != LocationPermission.denied) {
        Position p = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = p.latitude;
        longitude = p.longitude;
      } else {
        print('permission not granted');
      }
    } catch (e) {
      print(e);
    }
  }
}
