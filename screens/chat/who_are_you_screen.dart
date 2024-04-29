import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guesswho/common/unboxerscorp_colors.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';
import 'package:guesswho/screens/chat/chat_screen.dart';
import 'package:guesswho/util/navigate.dart';
import 'package:guesswho/widgets/main_app_bar_widget.dart';
import 'package:guesswho/widgets/midium_button_widget.dart';
import 'package:guesswho/widgets/select_button_widget.dart';
import 'package:guesswho/widgets/sign_up_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class WhoAreYouScreen extends StatefulWidget {
  const WhoAreYouScreen({super.key});

  @override
  State<WhoAreYouScreen> createState() => _WhoAreYouScreenState();
}

class _WhoAreYouScreenState extends State<WhoAreYouScreen> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _pickedImgs = [];
  String nickname = "";

  Future<void> _pickimg() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      print(images);
      setState(() {
        _pickedImgs = images;
      });
    }
  }

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
                      const Text('너가 누군지 알려줘!',
                          style: UnboxersCorpFonts.title1),
                      const SizedBox(height: 8),
                      const Text('이번 대화에서 사용할 프로필을 설정해줘😎',
                          style: UnboxersCorpFonts.descriptionWhite),
                      const SizedBox(height: 20),
                      if (_pickedImgs.isEmpty)
                        Image.asset('lib/assets/images/anonymous.png',
                            width: 100, height: 100)
                      else
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(999999),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(File(_pickedImgs[0].path)))),
                        ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () async {
                          HapticFeedback.mediumImpact();
                          _pickimg();
                        },
                        child: const Text('Add Photo',
                            style: TextStyle(
                                color: UnboxersCorpColors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: TextField(
                          style:
                              const TextStyle(color: UnboxersCorpColors.white),
                          onChanged: (text) {
                            setState(() {
                              nickname = text;
                            });
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 20),
                              fillColor:
                                  const Color.fromRGBO(118, 118, 128, 0.24),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Nickname for this chat',
                              hintStyle: const TextStyle(
                                  fontSize: 17,
                                  color: Color.fromRGBO(235, 235, 245, 0.6))),
                        ),
                      ),
                      const SizedBox(height: 40),
                      if (nickname.isNotEmpty)
                        SelectButtonWidget(
                          text: "대화방 들어가기",
                          color: UnboxersCorpColors.blue,
                          onClick: () {
                            navigateTo(context, const ChatScreen());
                          },
                        ),
                      const SizedBox(height: 12),
                      SelectButtonWidget(
                        text: "취소",
                        color: UnboxersCorpColors.darkgray,
                        onClick: () {
                          navigateBack(context);
                        },
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
