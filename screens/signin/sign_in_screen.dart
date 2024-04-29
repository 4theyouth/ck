import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guesswho/apis/getVerificationCode.dart';
import 'package:guesswho/apis/requestSignIn.dart';
import 'package:guesswho/apis/requestSignUp.dart';
import 'package:guesswho/common/unboxerscorp_colors.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';
import 'package:guesswho/provider/signup.dart';
import 'package:guesswho/screens/signup/get_notification_screen.dart';
import 'package:guesswho/util/internal_error_alert.dart';
import 'package:guesswho/util/navigate.dart';
import 'package:guesswho/widgets/button_widget.dart';
import 'package:guesswho/widgets/sign_up_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isResentVerificationCode = false;

  @override
  Widget build(BuildContext context) {
    var signupContext = Provider.of<SignupContext>(context);
    return Scaffold(
      appBar: SignUpAppBarWidget(appBar: AppBar()),
      backgroundColor: UnboxersCorpColors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: SizedBox(
                width: 390.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '돌아온걸 환영해!',
                      style: UnboxersCorpFonts.title1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 318.w,
                      child: TextField(
                        onChanged: (verificationCode) {
                          signupContext.inputVerificationCode(verificationCode);
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "받은 코드를 입력해줘",
                            hintStyle: UnboxersCorpFonts.textFieldPlaceHolder),
                        style: UnboxersCorpFonts.textField,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (!isResentVerificationCode)
                      GestureDetector(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          getVerificationCode(
                              context, signupContext.phoneNumber);
                          setState(() {
                            isResentVerificationCode = true;
                          });
                        },
                        child: const Text("인증코드 다시 받기",
                            style: UnboxersCorpFonts.modalTitle),
                      )
                    else
                      const Text("인증코드를 다시 보냈어!",
                          style: UnboxersCorpFonts.modalTitle),
                    const SizedBox(height: 30),
                    if (signupContext.verificationCode.length == 6)
                      ButtonWidget(
                        text: "시작하기",
                        onClick: () async {
                          if (await requestSignIn(context, signupContext)) {
                            navigateTo(context, const GetNotificationScreen());
                          } else {
                            internalErrorAlert(context);
                          }
                        },
                      )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
