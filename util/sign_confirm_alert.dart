import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';

Future<bool> signConfirmAlert(
  BuildContext context,
) async {
  bool isCancel = false;
  await showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Theme(
      data: ThemeData.dark(),
      child: CupertinoAlertDialog(
        title: const Text(
          '회원가입을 취소할거야?',
          style: UnboxersCorpFonts.subtitle,
        ),
        content:
            const Text("처음부터 다시 진행해야해", style: UnboxersCorpFonts.description),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              isCancel = true;
            },
            child: const Text(
              '취소',
              style: UnboxersCorpFonts.modalReject,
            ),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('닫기'),
          ),
        ],
      ),
    ),
  );
  return isCancel;
}
