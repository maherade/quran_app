import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/presentation/screens/quran_screen/quran_screen.dart';
import 'package:islami_app/styles/color_manager.dart';

class SplashScreen extends StatefulWidget {
   const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const QuranScreen(),),);
    });
    return Container(
      color: ColorManager.primaryColor,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Image.asset("assets/images/logo.png",width: MediaQuery.sizeOf(context).width*.35,height: MediaQuery.sizeOf(context).height*.35),
      ),
      );
  }
}
