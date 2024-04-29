import 'package:flutter/material.dart';
import 'package:guesswho/common/unboxerscorp_colors.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';
import 'package:guesswho/screens/login_screen.dart';
import 'package:guesswho/util/navigate.dart';
import 'package:guesswho/util/sign_confirm_alert.dart';

class SignUpWarningAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final AppBar appBar;
  const SignUpWarningAppBarWidget({super.key, required this.appBar});

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
        onPressed: () async {
          if (await signConfirmAlert(context)) {
            navigateTo(context, const LoginScreen());
          }
        },
      ),
    );
  }
}
