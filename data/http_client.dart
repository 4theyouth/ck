import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guesswho/apis/getVerificationCodeLogin.dart';
import 'package:guesswho/provider/signup.dart';
import 'package:guesswho/screens/signin/sign_in_screen.dart';
import 'package:guesswho/screens/signup/phone_verify_screen.dart';
import 'package:guesswho/util/navigate.dart';
import 'package:guesswho/util/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

void toastmessage401(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16);
}

void toastmessage500() {
  showToast("서버에 오류가 발생했습니다. 조금후에 다시 시도해주세요.");
}

Future<dynamic> sendSignRequest(
    String url, Map<String, dynamic>? body, BuildContext context) async {
  http.Response response;
  if (body == null) {
    response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  } else {
    response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  final parsingdata;

  print(response.statusCode + 9999);
  if (response.statusCode == 200 || response.statusCode == 201) {
    if (response.bodyBytes.isEmpty) {
      // 응답이 비어있을 경우 예외 처리
      print(response.statusCode);
      print('API 응답이 비어있습니다.');
      return "비어있음";
    }
    parsingdata = jsonDecode(utf8.decode(response.bodyBytes));
    return parsingdata;
  } else if (response.statusCode == 400) {
    return response;
  } else if (response.statusCode == 403) {
    http.Response response1;
    print("403이 시작됨");
    if (body == null) {
      response1 = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );
    } else {
      print("실행됨");
      response1 = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
        },
      );
    }
    if (response1.bodyBytes.isEmpty) {
      // 응답이 비어있을 경우 예외 처리
      print(response1.statusCode);
      print('API 응답이 비어있습니다.');
      return "비어있음";
    }
    final parsingdata;
    parsingdata = jsonDecode(utf8.decode(response1.bodyBytes));

    print(parsingdata);
    if (response1.statusCode == 200 || response1.statusCode == 201) {
      return parsingdata;
    } else if (response1.statusCode == 403) {
      print(parsingdata);

      return null;
    } else if (response1.statusCode == 404) {
      print(parsingdata);
      return null;
    } else if (response1.statusCode == 409) {
      print(parsingdata);
      return null;
    } else {
      print(parsingdata);
      toastmessage500();
      return null;
    }
  } else if (response.statusCode == 404) {
    parsingdata = jsonDecode(utf8.decode(response.bodyBytes));
    print(parsingdata);
    return null;
  } else if (response.statusCode == 409) {
    parsingdata = jsonDecode(utf8.decode(response.bodyBytes));
    print(parsingdata);
    return null;
  } else {
    parsingdata = jsonDecode(utf8.decode(response.bodyBytes));
    print(parsingdata);

    toastmessage500();
    return null;
  }
}

Future<dynamic> sendPostRequest(
    String url, Map<String, dynamic>? body, BuildContext context) async {
  http.Response response;
  if (body == null) {
    response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  } else {
    response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  final parsingdata;

  if (response.statusCode == 200 || response.statusCode == 201) {
    if (response.bodyBytes.isEmpty) {
      // 응답이 비어있을 경우 예외 처리
      print(response.statusCode);
      print('API 응답이 비어있습니다.');
      return "비어있음";
    }
    parsingdata = jsonDecode(utf8.decode(response.bodyBytes));
    return parsingdata;
  } else if (response.statusCode == 403) {
    http.Response response1;
    print("403이 시작됨");
    if (body == null) {
      response1 = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );
    } else {
      print("실행됨");
      response1 = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
        },
      );
    }
    if (response1.bodyBytes.isEmpty) {
      // 응답이 비어있을 경우 예외 처리
      print(response1.statusCode);
      print('API 응답이 비어있습니다.');
      return "비어있음";
    }
    final parsingdata;
    parsingdata = jsonDecode(utf8.decode(response1.bodyBytes));

    print(parsingdata);
    if (response1.statusCode == 200 || response1.statusCode == 201) {
      return parsingdata;
    } else if (response1.statusCode == 403) {
      print(parsingdata);

      return null;
    } else if (response1.statusCode == 404) {
      print(parsingdata);
      return null;
    } else if (response1.statusCode == 409) {
      print(parsingdata);
      return null;
    } else {
      print(parsingdata);
      toastmessage500();
      return null;
    }
  } else if (response.statusCode == 404) {
    parsingdata = jsonDecode(utf8.decode(response.bodyBytes));
    print(parsingdata);
    return null;
  } else if (response.statusCode == 409) {
    parsingdata = jsonDecode(utf8.decode(response.bodyBytes));
    print(parsingdata);
    return null;
  } else {
    parsingdata = jsonDecode(utf8.decode(response.bodyBytes));
    print(parsingdata);

    toastmessage500();
    return null;
  }
}

Future<dynamic> sendVerifyRequest(String url, Map<String, String>? header,
    BuildContext context, String phoneNumber) async {
  var response;

  if (header == null) {
    response = await http.get(Uri.parse(url));
  } else {
    response = await http.get(Uri.parse(url), headers: header);
  }
  final parsingdata = jsonDecode(utf8.decode(response.bodyBytes));

  print(response.statusCode);
  if (response.statusCode == 200 || response.statusCode == 201) {
    // 응답이 성공인 경우
    print(parsingdata);
    navigateTo(context, const PhoneVerifyScreen());
    return parsingdata;
  } else if (response.statusCode == 400) {
    getVerificationCodeLogin(context, phoneNumber);
    navigateTo(context, const SignInScreen());
  } else if (response.statusCode == 401) {
    print("401입니다");
    print(parsingdata);

    return null;
  } else if (response.statusCode == 403) {
    print(parsingdata);
    return null;
  } else if (response.statusCode == 404) {
    print(parsingdata);
    return null;
  } else if (response.statusCode == 409) {
    print(parsingdata);
    return null;
  } else {
    print(parsingdata);
    toastmessage500();
    return null;
  }
}

Future<dynamic> sendGetRequest(
    String url, Map<String, String>? header, BuildContext context) async {
  var response;

  if (header == null) {
    response = await http.get(Uri.parse(url));
  } else {
    response = await http.get(Uri.parse(url), headers: header);
  }
  final parsingdata = jsonDecode(utf8.decode(response.bodyBytes));

  print(response.statusCode);
  if (response.statusCode == 200 || response.statusCode == 201) {
    // 응답이 성공인 경우
    print(parsingdata);
    return parsingdata;
  } else if (response.statusCode == 400) {
    return 400;
  } else if (response.statusCode == 401) {
    print("401입니다");
    print(parsingdata);

    return null;
  } else if (response.statusCode == 403) {
    print(parsingdata);
    return null;
  } else if (response.statusCode == 404) {
    print(parsingdata);
    return null;
  } else if (response.statusCode == 409) {
    print(parsingdata);
    return null;
  } else {
    print(parsingdata);
    toastmessage500();
    return null;
  }
}
