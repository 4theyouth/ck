import 'package:guesswho/data/http_client.dart';

void getVerificationCodeLogin(context, String phoneNumber) async {
  try {
    String url =
        "http://192.168.1.123:6938/api/v1/users/verify-phone-number/$phoneNumber?phone_verify_type=sign_in";
    await sendGetRequest(url, null, context);
    print("done");
  } catch (e) {
    print(e);
  }
}
