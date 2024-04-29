import 'package:flutter/material.dart';
import 'package:guesswho/common/unboxerscorp_colors.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';

class SignUpAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final AppBar appBar;
  const SignUpAppBarWidget({super.key, required this.appBar});

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: UnboxersCorpColors.black,
      title: const Text(
        "회원가입",
        style: UnboxersCorpFonts.button,
      ),
      leading: IconButton(
        icon: Row(
          children: const [
            Icon(Icons.arrow_back_ios_rounded, color: UnboxersCorpColors.blue),
          ],
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
