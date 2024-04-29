import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesswho/common/unboxerscorp_colors.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';
import 'package:guesswho/util/report_modal.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UnboxersCorpColors.black,
      appBar: AppBar(
        toolbarHeight: 90,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset('lib/assets/images/anonymous.png',
                  width: 40, height: 40),
              const Text("익명",
                  style:
                      TextStyle(color: UnboxersCorpColors.white, fontSize: 11))
            ],
          ),
        ),
        backgroundColor: UnboxersCorpColors.black,
        leading: Container(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).restorablePush(reportModal);
              },
              icon: Image.asset('lib/assets/images/more.png'))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(children: [
          Column(
            children: const [
              BubbleSpecialThree(
                text: 'Lorem ipsum dolor sit amet, consect.',
                color: UnboxersCorpColors.blue,
                tail: true,
                isSender: true,
                textStyle: UnboxersCorpFonts.chatting,
              ),
              SizedBox(height: 10),
              BubbleSpecialThree(
                text: 'Lorem ipsum dolor sit amet, consect.',
                color: UnboxersCorpColors.dark,
                tail: true,
                isSender: false,
                textStyle: UnboxersCorpFonts.chatting,
              ),
              SizedBox(height: 10),
              BubbleSpecialThree(
                text: 'Lorem ipsum dolor sit amet, consect.',
                color: UnboxersCorpColors.blue,
                tail: true,
                isSender: true,
                textStyle: UnboxersCorpFonts.chatting,
              ),
              SizedBox(height: 10),
              BubbleSpecialThree(
                text: 'Lorem ipsum dolor sit amet, consect.',
                color: UnboxersCorpColors.dark,
                tail: true,
                isSender: false,
                textStyle: UnboxersCorpFonts.chatting,
              ),
              SizedBox(height: 10),
              BubbleSpecialThree(
                text: 'Lorem ipsum dolor sit amet, consect.',
                color: UnboxersCorpColors.blue,
                tail: true,
                isSender: true,
                textStyle: UnboxersCorpFonts.chatting,
              ),
              SizedBox(height: 10),
              BubbleSpecialThree(
                text: 'Lorem ipsum dolor sit amet, consect.',
                color: UnboxersCorpColors.dark,
                tail: true,
                isSender: false,
                textStyle: UnboxersCorpFonts.chatting,
              ),
            ],
          ),
          Positioned(
            // top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                padding: EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                    bottom: MediaQuery.of(context).padding.bottom),
                color: UnboxersCorpColors.black,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9999),
                      color: UnboxersCorpColors.chattingField,
                      border: Border.all(
                          color: UnboxersCorpColors.chattingBorder, width: 1)),
                  child: const TextField(
                    style: UnboxersCorpFonts.textFieldSmall,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24),
                      hintText: '메세지 보내기',
                      hintStyle: UnboxersCorpFonts.textFieldSmallPlaceHolder,
                      border: OutlineInputBorder(),
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                )),
          ),
        ]),
      ),
    );
  }
}
