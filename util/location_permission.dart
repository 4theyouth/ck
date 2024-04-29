import 'package:permission_handler/permission_handler.dart';

Future<bool> locationPermission() async {
  var status = await Permission.location.request();
  if (status.isGranted) {
    return true;
  } else if (status.isDenied) {
    return false;
  }
  return false;
}
