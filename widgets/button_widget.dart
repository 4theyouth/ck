import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guesswho/common/unboxerscorp_colors.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final Color color;
  final String text;
  final dynamic onClick;

  const ButtonWidget(
      {super.key,
      this.color = UnboxersCorpColors.blue,
      this.text = "",
      this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        onClick();
      },
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
          child: Text(
            text,
            style: UnboxersCorpFonts.button,
          ),
        ),
      ),
    );
  }
}
