import 'package:guesswho/data/http_client.dart';
import 'package:guesswho/models/school.dart';
import 'package:guesswho/models/school_list.dart';

Future<List<dynamic>> getSchoolByLocation(
    context, double lat, double lon) async {
  try {
    String url = "http://192.168.1.123:6938/api/v1/schools";
    Map<String, dynamic> res = await sendPostRequest(
        url,
        {
          "latitude": lat,
          "longitude": lon,
        },
        context);

    print(res);
    return SchoolList.fromJson(res).schools;
  } catch (e) {
    print(e);
  }
  return [];
}
