import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guesswho/provider/signup.dart';
import 'package:guesswho/provider/user.dart';
import 'package:guesswho/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserContext()),
        ChangeNotifierProvider.value(value: SignupContext()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (BuildContext context, Widget? child) => const MaterialApp(
            title: "GuessWho",
            debugShowCheckedModeBanner: false,
            home: LoginScreen()),
      ),
    );
  }
}
