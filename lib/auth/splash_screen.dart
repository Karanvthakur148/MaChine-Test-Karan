import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test_flutter/auth/signin_screen.dart';

import '../../constanst/color_constanst.dart';
import '../home_page/home_screen.dart';
import '../services/db.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      getUserLoggedInStatus();
    });
    super.initState();
  }

  getUserLoggedInStatus() async {
    await Db.getAuthToken().then((value) async {
      log("value : $value");
      if (value == "" || value == null) {
        final route = MaterialPageRoute(builder: (context) => AuthScreen());
        Navigator.pushAndRemoveUntil(context, route, (route) => false);
        // nextScreenReplace(context, LogInScreen());
      } else {
        final route = MaterialPageRoute(builder: (context) => HomeScreen());
        Navigator.pushAndRemoveUntil(context, route, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            "Flutter App",
            style: GoogleFonts.dmSans(fontSize: 40.sp, fontWeight: FontWeight.w700, color: ColorConstants.primaryThemeColor),
          ),
        ));
  }
}
