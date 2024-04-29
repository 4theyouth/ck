import 'package:flutter/material.dart';
import 'package:guesswho/common/unboxerscorp_colors.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';
import 'package:guesswho/screens/chat/new_match_screen.dart';
import 'package:guesswho/util/navigate.dart';
import 'package:guesswho/widgets/button_widget.dart';
import 'package:guesswho/widgets/main_app_bar_widget.dart';
import 'package:guesswho/widgets/sign_up_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBarWidget(appBar: AppBar()),
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
                    const Text('조금만 기다려줘...', style: UnboxersCorpFonts.title1),
                    const SizedBox(height: 10),
                    const Text('17', style: UnboxersCorpFonts.title1),
                    const SizedBox(height: 10),
                    const Text("명의 친구들이 먼저 대기하고 있어",
                        style: UnboxersCorpFonts.descriptionWhite),
                    const SizedBox(height: 30),
                    ButtonWidget(
                      text: "13 People in Waiting Room",
                      onClick: () {
                        navigateTo(context, const NewMatchScreen());
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
