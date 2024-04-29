import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';

Route<void> helpModal(BuildContext context, Object? arguments) {
  return CupertinoModalPopupRoute<void>(
    builder: (BuildContext context) {
      return Theme(
        data: ThemeData.dark(),
        child: CupertinoActionSheet(
          title: const Text(
            '어떻게 도와줄까?',
            style: UnboxersCorpFonts.modalTitle,
          ),
          message: const Text('좋은 의견들은 언제나 환영이야'),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              child: const Text(
                '로그아웃',
                style: UnboxersCorpFonts.modalApprove,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text(
                '계정 삭제',
                style: UnboxersCorpFonts.modalReject,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text(
                '문의하기',
                style: UnboxersCorpFonts.modalApprove,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
