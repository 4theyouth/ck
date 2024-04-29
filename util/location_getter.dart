import 'package:geolocator/geolocator.dart';

Future<List<double>> locationGetter() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }
  try {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return [position.latitude, position.longitude];
  } catch (e) {
    print(e);
  }
  return [-1, -1];
}
