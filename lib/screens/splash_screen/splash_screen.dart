import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_trip/screens/on_boarding/login_screen/login_screen.dart';
import 'package:my_trip/screens/on_boarding/signUp_screen/signUp_screen.dart' hide SignUpScreen;

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    });
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffF2F2F2),
        child: Center(child: Image.asset("assets/images/splash_logo.png",height: 110,width: 110,)),
      ),
    );
  }
}
