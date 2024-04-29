import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesswho/common/unboxerscorp_colors.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';

Route<void> reportModal(BuildContext context, Object? arguments) {
  return CupertinoModalPopupRoute<void>(
    builder: (BuildContext context) {
      return Theme(
        data: ThemeData.dark(),
        child: CupertinoActionSheet(
          title: const Text(
            '문제가 발생했니?',
            style: UnboxersCorpFonts.modalTitle,
          ),
          message: const Text('언제든지 신고하고 나갈 수 있어'),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              child: const Text(
                '신고하고 나가기',
                style: UnboxersCorpFonts.modalReject,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).restorablePush(_whyYouReport);
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
          cancelButton: CupertinoActionSheetAction(
            child: const Text('취소',
                style: TextStyle(
                    fontSize: 20,
                    color: UnboxersCorpColors.blue,
                    fontWeight: FontWeight.w800)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    },
  );
}

Route<void> _whyYouReport(BuildContext context, Object? arguments) {
  return CupertinoModalPopupRoute<void>(
    builder: (BuildContext context) {
      return Theme(
        data: ThemeData.dark(),
        child: CupertinoActionSheet(
          title: const Text(
            '신고하는 이유를 알려줘!',
            style: UnboxersCorpFonts.modalTitle,
          ),
          message: const Text('이녀석 콩밥 먹여줄게'),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              child: const Text(
                '미친놈',
                style: UnboxersCorpFonts.modalApprove,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text(
                '존잘',
                style: UnboxersCorpFonts.modalApprove,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text(
                '찐따',
                style: UnboxersCorpFonts.modalApprove,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text(
                '일진',
                style: UnboxersCorpFonts.modalApprove,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text(
                '그 외...',
                style: UnboxersCorpFonts.modalApprove,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('취소',
                style: TextStyle(
                    fontSize: 20,
                    color: UnboxersCorpColors.blue,
                    fontWeight: FontWeight.w800)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    },
  );
}
