import 'package:permission_handler/permission_handler.dart';

Future<bool> notificationPermission() async {
  var status = await Permission.notification.request();
  if (status.isGranted) {
    return true;
  } else if (status.isDenied) {
    return false;
  }
  return false;
}
