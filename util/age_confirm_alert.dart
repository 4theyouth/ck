import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';

Future<bool> ageConfirmAlert(
  BuildContext context,
  int age,
) async {
  bool isApprove = false;
  await showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Theme(
      data: ThemeData.dark(),
      child: CupertinoAlertDialog(
        title: const Text(
          '입력한 나이를 확인해줘!',
          style: UnboxersCorpFonts.subtitle,
        ),
        content: Text("나이 : $age세\n한번 설정한 나이는 바꿀 수 없어",
            style: UnboxersCorpFonts.description),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('수정'),
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
