import 'package:flutter/material.dart';
import 'package:interview/src/views/ui/checkinout.dart';
import 'package:interview/src/views/ui/login.dart';
import 'package:interview/src/views/ui/registation.dart';
import 'package:interview/src/views/utils/contants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'calander.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        centerTitle: true,
        title: Text(
          'Dashboard',
          style: TextStyle(color: kBlackColor),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.exit_to_app_sharp,
                color: kBlackColor,
              ),
              onPressed: () async {
                SharedPreferences _prefs =
                    await SharedPreferences.getInstance();
                _prefs.clear();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                    (route) => false);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.calendar_today,
                            size: 40,
                            color: kBlueColor,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GogleMapScreen()),
                            );
                          },
                        ),
                        SizedBox(height: 5),
                        Text('Check In/Out')
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.app_registration,
                            size: 40,
                            color: kBlueColor,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registation()),
                            );
                          },
                        ),
                        SizedBox(height: 5),
                        Text('Registration')
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.list_alt_rounded,
                            size: 40,
                            color: kBlueColor,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Attandance()),
                            );
                          },
                        ),
                        SizedBox(height: 5),
                        Text('Attendance List')
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
