import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/assets/assets.gen.dart';
import 'package:next_match/src/modules/auth/login/presentation/ui/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(milliseconds: 3200),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false);
        super.initState();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height.h,
        width: MediaQuery.sizeOf(context).width.w,
        child: Assets.images.splashScreen.svg(
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
