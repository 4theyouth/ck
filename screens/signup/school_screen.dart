import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guesswho/apis/getSchoolByLocation.dart';
import 'package:guesswho/common/unboxerscorp_colors.dart';
import 'package:guesswho/common/unboxerscorp_fonts.dart';
import 'package:guesswho/models/school.dart';
import 'package:guesswho/provider/signup.dart';
import 'package:guesswho/screens/signup/gender_screen.dart';
import 'package:guesswho/util/location_getter.dart';
import 'package:guesswho/util/location_permission.dart';
import 'package:guesswho/util/navigate.dart';
import 'package:guesswho/util/school_confirm_alert.dart';
import 'package:guesswho/widgets/button_widget.dart';
import 'package:guesswho/widgets/sign_up_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SchoolScreen extends StatefulWidget {
  const SchoolScreen({super.key});

  @override
  State<SchoolScreen> createState() => _SchoolScreenState();
}

class _SchoolScreenState extends State<SchoolScreen> {
  List<School> schoolList = [];
  bool schoolIsNull = false;
  bool isAgreeLocationPermission = false;

  void handleFindSchoolByLocation(context) async {
    if (await locationPermission()) {
      isAgreeLocationPermission = true;
      List<double> location = await locationGetter();
      dynamic schools =
          await getSchoolByLocation(context, location[0], location[1]);
      if (schools == null) {
        schoolIsNull = true;
      } else {
        print(schools);
        for (int i = 0; i < schools.length; i++) {
          School school = School.fromJson(schools[i]);
          print(school.name);
          schoolList.add(School(school.id, school.name, school.type));
        }
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var signupContext = Provider.of<SignupContext>(context);

    return Scaffold(
      appBar: SignUpAppBarWidget(appBar: AppBar()),
      backgroundColor: UnboxersCorpColors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: SizedBox(
                width: 390.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '어느 학교에\n다니는지 알려줘!',
                      style: UnboxersCorpFonts.title1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    if (!isAgreeLocationPermission)
                      const Text("학교 인증을 위해 어플리케이션 위치 접근을 허용해줘!",
                          style: UnboxersCorpFonts.description),
                    if (schoolIsNull)
                      const Text('근처에 학교를 찾을 수 없어!',
                          style: UnboxersCorpFonts.description),
                    const SizedBox(height: 30),
                    if (schoolList.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(12)),
                          child: Container(
                            constraints: BoxConstraints(maxHeight: 200.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: schoolList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    HapticFeedback.mediumImpact();
                                    signupContext
                                        .inputSchoolId(schoolList[index].id);
                                    navigateTo(context, const GenderScreen());
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: UnboxersCorpColors.schoolGray,
                                        border: Border(
                                          bottom: BorderSide(
                                            color: UnboxersCorpColors
                                                .schoolSeparator,
                                            width: 1,
                                            style: BorderStyle.solid,
                                          ),
                                        )),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 11),
                                    child: Text(
                                      schoolList[index].name,
                                      style: UnboxersCorpFonts.chatting,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 30),
                    if (!isAgreeLocationPermission)
                      ButtonWidget(
                        text: "위치 접근 허용하기",
                        onClick: () {
                          handleFindSchoolByLocation(context);
                        },
                      )
                    else
                      GestureDetector(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          schoolConfirmAlert(context);
                        },
                        child: const Text('찾는 학교가 보이지 않는다면',
                            style: UnboxersCorpFonts.descriptionButton),
                      ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
