import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';

Future<bool> internalErrorAlert(
  BuildContext context,
) async {
  bool isApprove = false;
  await showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Theme(
      data: ThemeData.dark(),
      child: CupertinoAlertDialog(
        title: const Text(
          '오류가 발생했어!',
          style: UnboxersCorpFonts.subtitle,
        ),
        content: const Text("계속 오류가 발생한다면 문의해줘!",
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
