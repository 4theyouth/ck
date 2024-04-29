import 'package:flutter/material.dart';
import 'package:guesswho/common/unboxerscorp_colors.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';
import 'package:guesswho/util/help_modal.dart';
import 'package:guesswho/widgets/button_widget.dart';
import 'package:guesswho/widgets/sign_up_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InviteMoreFriendsScreen extends StatelessWidget {
  const InviteMoreFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("경기과학고등학교", style: UnboxersCorpFonts.button)),
        backgroundColor: UnboxersCorpColors.black,
        leading: Container(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).restorablePush(helpModal);
              },
              icon: Image.asset('lib/assets/images/more.png'))
        ],
      ),
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
                    const Text('친구들을 초대해줘!', style: UnboxersCorpFonts.title1),
                    const SizedBox(height: 10),
                    const Text('17', style: UnboxersCorpFonts.title1),
                    const SizedBox(height: 10),
                    const Text(
                        "명의 친구들이 GuessWho를 사용하고 있어!\n시작하려면 더 많은 친구들을 모아야해",
                        style: UnboxersCorpFonts.descriptionWhite),
                    const SizedBox(height: 30),
                    ButtonWidget(
                      text: "초대링크 복사",
                      onClick: () {},
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
