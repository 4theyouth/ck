import 'package:flutter/material.dart';
import 'package:guesswho/apis/getVerificationCode.dart';
import 'package:guesswho/common/unboxerscorp_colors.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';
import 'package:guesswho/provider/signup.dart';
import 'package:guesswho/screens/signup/phone_verify_screen.dart';
import 'package:guesswho/util/navigate.dart';
import 'package:guesswho/widgets/button_widget.dart';
import 'package:guesswho/widgets/sign_up_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PhoneInputScreen extends StatelessWidget {
  const PhoneInputScreen({super.key});

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
                      '전화번호를 입력해줘!\n3초만에 도와줄게🚀',
                      style: UnboxersCorpFonts.title1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 318.w,
                      child: TextField(
                        onChanged: (phoneNumber) {
                          signupContext.inputPhoneNumber(phoneNumber);
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "01012345678",
                            hintStyle: UnboxersCorpFonts.textFieldPlaceHolder),
                        style: UnboxersCorpFonts.textField,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    if (signupContext.phoneNumber.length == 11)
                      ButtonWidget(
                        text: "다음",
                        onClick: () {
                          getVerificationCode(
                              context, signupContext.phoneNumber);
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
