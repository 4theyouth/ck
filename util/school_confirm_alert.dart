import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';

Future<bool> schoolConfirmAlert(
  BuildContext context,
) async {
  bool isApprove = false;
  await showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Theme(
      data: ThemeData.dark(),
      child: CupertinoAlertDialog(
        title: const Text(
          '학교 근처에서만 인증할 수 있어!',
          style: UnboxersCorpFonts.subtitle,
        ),
        content: const Text("근처 3km 안에 있는 학교만 찾을 수 있어.\n그래도 찾을 수 없다면 문의해줘!",
            style: UnboxersCorpFonts.description),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('문의하기'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              isApprove = true;
            },
            child: const Text('확인'),
          ),
        ],
      ),
    ),
  );
  return isApprove;
}
