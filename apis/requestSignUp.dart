import 'package:guesswho/data/http_client.dart';
import 'package:guesswho/models/sign_response.dart';
import 'package:guesswho/models/token.dart';
import 'package:guesswho/models/user.dart';
import 'package:guesswho/provider/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> requestSignUp(context, SignupContext data) async {
  print(data.gender);
  print(data.phoneNumber);
  print(data.wantGender);
  print(data.verificationCode);
  print(99999);
  try {
    String url = "http://192.168.1.123:6938/api/v1/users/sign-up";
    dynamic result = await sendSignRequest(
        url,
        {
          "gender": data.gender,
          "want_gender": data.wantGender,
          "phone_number": data.phoneNumber,
          "school_id": 1,
          "verification_code": data.verificationCode,
        },
        context);
    if (result == null) return false;

    SignResponse res = SignResponse.fromJson(result);
    if (result == null) return false;

    User user = User.fromJson(res.user);
    Token token = Token.fromJson(res.token);

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
