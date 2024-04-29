import 'package:flutter/material.dart';
import 'package:guesswho/common/unboxerscorp_colors.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';
import 'package:guesswho/provider/signup.dart';
import 'package:guesswho/screens/signup/school_screen.dart';
import 'package:guesswho/util/age_confirm_alert.dart';
import 'package:guesswho/util/age_reject_alert.dart';
import 'package:guesswho/util/navigate.dart';
import 'package:guesswho/widgets/button_widget.dart';
import 'package:guesswho/widgets/sign_up_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AgeScreen extends StatelessWidget {
  const AgeScreen({super.key});

  Future<void> handleCheckAge(context, int age) async {
    if (age <= 14) {
      await ageRejectAlert(context);
    } else {
      if (await ageConfirmAlert(context, age)) {
        navigateTo(context, const SchoolScreen());
      }
    }
  }

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
                    const Text('올해 몇 살이야?', style: UnboxersCorpFonts.title1),
                    SizedBox(
                      width: 318.w,
                      child: TextField(
                        onChanged: (age) {
                          signupContext.inputAge(int.tryParse(age) ?? -1);
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "나이를 입력해줘",
                            hintStyle: UnboxersCorpFonts.textFieldPlaceHolder),
                        style: UnboxersCorpFonts.textField,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text("GuessWho는 만 14세 미만이면 사용할 수 없어",
                        style: UnboxersCorpFonts.description),
                    const SizedBox(height: 30),
                    if (signupContext.age != -1)
                      ButtonWidget(
                        text: "다음",
                        onClick: () {
                          handleCheckAge(context, signupContext.age);
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
