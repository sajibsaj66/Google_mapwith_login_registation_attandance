import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:interview/src/business_logics/utils/constants.dart';
import 'package:interview/src/views/ui/home.dart';
import 'package:interview/src/views/ui/login.dart';
import 'package:interview/src/views/utils/contants.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () async => await userLoggedIn()
            ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Home()))
            : Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: kBlueColor
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('iBOS', style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: kWhiteColor
                  ),),
                  SizedBox(height: 15),
                  CircularProgressIndicator()
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Future<bool> userLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Logger().d(token);
    if (token != null) {
      UserData.token = token;
      return true;
    }
    return false;
  }
}
