import 'dart:async';
import 'package:camel/Api/ClientApi.dart';
import 'package:camel/DataBase/config.dart';
import 'package:camel/statics/DataBaseConstants.dart';
import 'package:camel/statics/bottom_navigation.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget{ 
  _SplashScreenState createState()=> _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{
  Timer timer;


  String errorMsg = "" ;
  @override
  Widget build(BuildContext context) {
    timer =new Timer(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> BottomNavigationBarClass(1)));
    });
     return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.width/2,
              child: Image.asset("images/splash.png",fit: BoxFit.fill,)
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    timer.cancel() ;
  }
}