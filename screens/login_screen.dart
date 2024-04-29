import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guesswho/common/unboxerscorp_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';
import 'package:guesswho/screens/chat/waiting_screen.dart';
import 'package:guesswho/screens/invite_more_friends_screen.dart';
import 'package:guesswho/screens/signup/age_screen.dart';
import 'package:guesswho/screens/signup/get_notification_screen.dart';
import 'package:guesswho/screens/signup/phone_input_screen.dart';
import 'package:guesswho/util/navigate.dart';
import 'package:guesswho/widgets/button_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UnboxersCorpColors.dark,
        resizeToAvoidBottomInset: false,
        appBar: null,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  child: SizedBox(
                    width: 390.w,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 390.w,
                              height: 73.h,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        "lib/assets/images/someone.png"),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Someone in your school',
                                      style: UnboxersCorpFonts.smallHeader,
                                    ),
                                  ])),
                          const SizedBox(height: 30),
                          Expanded(
                              flex: 1,
                              child: Column(children: const [
                                Text("(어제) 오후 9:41",
                                    style: UnboxersCorpFonts.chattingDate),
                                BubbleSpecialThree(
                                  text: "너 오늘 수업 머야?",
                                  color: UnboxersCorpColors.blue,
                                  tail: true,
                                  isSender: true,
                                  textStyle: UnboxersCorpFonts.chatting,
                                ),
                                SizedBox(height: 10),
                                BubbleSpecialThree(
                                  text: "오늘 수학 수업... 살아남아야 된다",
                                  color: UnboxersCorpColors.black,
                                  tail: true,
                                  isSender: false,
                                  textStyle: UnboxersCorpFonts.chatting,
                                ),
                                SizedBox(height: 10),
                                BubbleSpecialThree(
                                  text: "헐 뭐야 나도 오늘 수학인데!! 우리 처음부터 같은 반이었어???",
                                  color: UnboxersCorpColors.blue,
                                  tail: true,
                                  isSender: true,
                                  textStyle: UnboxersCorpFonts.chatting,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Text(
                                      "10:02에 읽음",
                                      style: UnboxersCorpFonts.chattingDate,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ]))
                        ]),
                  ),
                )),
            Expanded(
                flex: 4,
                child: Container(
                  width: 390.w,
                  color: UnboxersCorpColors.black,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        "Quick Start",
                        style: UnboxersCorpFonts.title1,
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("lib/assets/images/logo.png", width: 80),
                          const Text(" 에 온걸 환영해!",
                              style: UnboxersCorpFonts.subtitle)
                        ],
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        "같은 학교의 누군가가 지금 너를 기다리고있어!\n\nGuess Who!\n남들한테 들키지 말라구 iMessage처럼\n 꾸며놨어😎",
                        style: UnboxersCorpFonts.chatting,
                        strutStyle: StrutStyle(
                          forceStrutHeight: true,
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      ButtonWidget(
                        text: "회원가입",
                        onClick: () {
                          navigateTo(context, const AgeScreen());
                        },
                      ),
                      // ButtonWidget(
                      //   text: "waiting",
                      //   onClick: () {
                      //     navigateTo(context, const WaitingScreen());
                      //   },
                      // ),
                      // ButtonWidget(
                      //   text: "invite more friends",
                      //   onClick: () {
                      //     navigateTo(context, const InviteMoreFriendsScreen());
                      //   },
                      // ),
                      const SizedBox(height: 140),
                      GestureDetector(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          navigateTo(context, const PhoneInputScreen());
                        },
                        child: const Text('이미 계정이 있다면?',
                            style: UnboxersCorpFonts.already),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
