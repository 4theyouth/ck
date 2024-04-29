import 'package:flutter/material.dart';
import 'package:guesswho/common/unboxerscorp_colors.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';
import 'package:guesswho/provider/signup.dart';
import 'package:guesswho/screens/chat/waiting_screen.dart';
import 'package:guesswho/screens/login_screen.dart';
import 'package:guesswho/screens/signup/want_gender_screen.dart';
import 'package:guesswho/util/navigate.dart';
import 'package:guesswho/util/notification_permission.dart';
import 'package:guesswho/widgets/select_button_widget.dart';
import 'package:guesswho/widgets/sign_up_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class GetNotificationScreen extends StatelessWidget {
  const GetNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Image.asset("lib/assets/images/chat_notification.png"),
                    const SizedBox(height: 30),
                    const Text('메세지가 올 때마다\n알림창을 띄워줄게',
                        style: UnboxersCorpFonts.title1),
                    const SizedBox(height: 30),
                    SelectButtonWidget(
                        text: "알림 허용하기",
                        color: UnboxersCorpColors.blue,
                        onClick: () async {
                          await notificationPermission();
                          navigateTo(context, const WaitingScreen());
                        }),
                    const SizedBox(height: 10),
                    SelectButtonWidget(
                        text: "다음에 설정하기",
                        color: UnboxersCorpColors.darkgray,
                        onClick: () {
                          navigateTo(context, const WaitingScreen());
                        }),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
