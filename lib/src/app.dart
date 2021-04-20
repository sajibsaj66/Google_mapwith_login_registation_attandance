import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:interview/src/views/ui/splash.dart';
import 'package:interview/src/views/utils/contants.dart';

class InterviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Splash(),
    );
  }
}
