import 'package:flutter/material.dart';
import 'package:guesswho/common/unboxerscorp_colors.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';
import 'package:guesswho/provider/signup.dart';
import 'package:guesswho/screens/signup/phone_input_screen.dart';
import 'package:guesswho/util/navigate.dart';
import 'package:guesswho/widgets/select_button_widget.dart';
import 'package:guesswho/widgets/sign_up_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class WantGenderScreen extends StatelessWidget {
  const WantGenderScreen({super.key});

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
                      '대화 상대로 만나고\n싶은 성별을 알려줘!',
                      style: UnboxersCorpFonts.title1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    SelectButtonWidget(
                        text: "남성",
                        color: UnboxersCorpColors.darkgray,
                        onClick: () {
                          signupContext.inputWantGender("M");
                          navigateTo(context, const PhoneInputScreen());
                        }),
                    const SizedBox(height: 10),
                    SelectButtonWidget(
                        text: "여성",
                        color: UnboxersCorpColors.darkgray,
                        onClick: () {
                          signupContext.inputWantGender("F");
                          navigateTo(context, const PhoneInputScreen());
                        }),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
