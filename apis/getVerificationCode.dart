import 'package:guesswho/data/http_client.dart';

void getVerificationCode(context, String phoneNumber) async {
  try {
    String url =
        "http://192.168.1.123:6938/api/v1/users/verify-phone-number/$phoneNumber?phone_verify_type=sign_up";
    var res = await sendVerifyRequest(url, null, context, phoneNumber);
    print(res + res);
    print("done");
  } catch (e) {
    print(e);
  }
}
