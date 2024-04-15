import 'dart:async';

import 'package:exam_ad_flutter/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Spacer(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('assets/splash.gif'),
            ),
          ),
          Spacer(),
          SpinKitWave(
            color: Colors.black,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
