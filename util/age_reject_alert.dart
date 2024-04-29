import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';

Future<bool> ageRejectAlert(
  BuildContext context,
) async {
  bool isApprove = false;
  await showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Theme(
      data: ThemeData.dark(),
      child: CupertinoAlertDialog(
        title: const Text(
          '만 14세 이상만 사용할 수 있어!',
          style: UnboxersCorpFonts.subtitle,
        ),
        content: const Text("GuessWho는 만 14세 이상 \n유저만 사용할 수 있어!",
            style: UnboxersCorpFonts.description),
        actions: <CupertinoDialogAction>[
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
