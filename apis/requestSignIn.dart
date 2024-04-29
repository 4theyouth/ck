import 'package:guesswho/data/http_client.dart';
import 'package:guesswho/models/school.dart';
import 'package:guesswho/models/sign_response.dart';
import 'package:guesswho/models/token.dart';
import 'package:guesswho/models/user.dart';
import 'package:guesswho/provider/signup.dart';
import 'package:guesswho/util/internal_error_alert.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> requestSignIn(context, SignupContext data) async {
  try {
    String url = "http://192.168.1.123:6938/api/v1/users/sign-in";
    dynamic result = await sendSignRequest(
        url,
        {
          "phone_number": data.phoneNumber,
          "verification_code": data.verificationCode,
        },
        context);

    SignResponse res = SignResponse.fromJson(result);
    if (res == null) return false;

    User user = User.fromJson(res.user);
    Token token = Token.fromJson(res.token);

    print(res);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("hashedId", user.hashedId);
    prefs.setString("gender", user.gender);
    prefs.setString("wantGender", user.wantGender);
    prefs.setString("role", user.role);
    prefs.setString("status", user.status);
    prefs.setInt("pendingChatCount", user.pendingChatCount);
    prefs.setInt("badge", user.badge);

    prefs.setInt("schoolId", user.school.id);
    prefs.setString("schoolName", user.school.name);
    prefs.setString("schoolType", user.school.type);

    prefs.setString("accessToken", token.accessToken);
    prefs.setString("refreshToken", token.refreshToken);
    prefs.setString("expires", token.expires);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
