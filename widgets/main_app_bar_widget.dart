import 'package:flutter/material.dart';
import 'package:guesswho/common/unboxerscorp_colors.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final AppBar appBar;
  const MainAppBarWidget({super.key, required this.appBar});

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  State<MainAppBarWidget> createState() => _MainAppBarWidgetState();
}

class _MainAppBarWidgetState extends State<MainAppBarWidget> {
  String schoolName = "";

  Future<String?> getSchoolFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String school = prefs.getString('schoolName') ?? "";

    setState(() {
      schoolName = school;
    });
  }

  @override
  void initState() {
    getSchoolFromLocalStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: UnboxersCorpColors.black,
      title: Text(
        schoolName,
        style: UnboxersCorpFonts.button,
      ),
      leading: Container(),
    );
  }
}
