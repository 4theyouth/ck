import 'package:flutter/material.dart';
import 'package:guesswho/common/unboxerscorp_colors.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';
import 'package:guesswho/screens/chat/who_are_you_screen.dart';
import 'package:guesswho/util/navigate.dart';
import 'package:guesswho/widgets/button_widget.dart';
import 'package:guesswho/widgets/main_app_bar_widget.dart';
import 'package:guesswho/widgets/midium_button_widget.dart';
import 'package:guesswho/widgets/sign_up_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewMatchScreen extends StatelessWidget {
  const NewMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBarWidget(appBar: AppBar()),
      backgroundColor: UnboxersCorpColors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000), // 여기서 0xFF는 알파(투명도) 값이고 나머지는 색상입니다.
              Color(0xFF180037),
            ],
          ),
        ),
        child: Column(
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
                      const Text('대화 상대를 찾았어!',
                          style: UnboxersCorpFonts.title1),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                            color: UnboxersCorpColors.dark,
                            borderRadius: BorderRadius.circular(12)),
                        width: 350,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 15),
                        child: Row(
                          children: [
                            Image.asset('lib/assets/images/someone.png',
                                width: 45, height: 45),
                            const SizedBox(width: 13),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('경기과학고등학교',
                                    style: TextStyle(
                                        color:
                                            UnboxersCorpColors.grayDescription,
                                        fontSize: 13)),
                                Text('익명',
                                    style: TextStyle(
                                        color: UnboxersCorpColors.white,
                                        fontSize: 15)),
                                Text('남자, 18',
                                    style: TextStyle(
                                        color: UnboxersCorpColors.white,
                                        fontSize: 13)),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MidiumButtonWidget(
                            text: "거절",
                            color: UnboxersCorpColors.darkgray,
                            onClick: () {
                              navigateBack(context);
                            },
                          ),
                          const SizedBox(width: 14),
                          MidiumButtonWidget(
                            text: "수락",
                            onClick: () {
                              navigateTo(context, const WhoAreYouScreen());
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
