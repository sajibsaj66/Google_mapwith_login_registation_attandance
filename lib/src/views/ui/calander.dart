import 'package:flutter/material.dart';
import 'package:interview/src/views/ui/home.dart';
import 'package:interview/src/views/utils/contants.dart';
import 'package:table_calendar/table_calendar.dart';

import 'home.dart';

class Attandance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            );
          },
        ),
        centerTitle: true,
        title: Text(
          "Attendance..",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white,
              elevation: 10,
              child: TableCalendar(
                // initialCalendarFormat: CalendarFormat.week,
                calendarStyle: CalendarStyle(
                    todayColor: Colors.orange,
                    selectedColor: Theme.of(context).primaryColor,
                    todayStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white)),
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  formatButtonTextStyle: TextStyle(color: Colors.white),
                  formatButtonShowsNext: false,
                ),
                startingDayOfWeek: StartingDayOfWeek.friday,

                onDaySelected: (date, events, _) {
                  print(date.toIso8601String());
                },

                builders: CalendarBuilders(
                  selectedDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                  todayDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                calendarController: _controller,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new ButtonBar(
              mainAxisSize: MainAxisSize
                  .min, // this will take space as minimum as posible(to center)
              children: <Widget>[
                ButtonTheme(
                  height: 50,
                  minWidth: 120,
                  child: RaisedButton(
                    color: Colors.green[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Present",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 120,
                  child: RaisedButton(
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Absent",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 120,
                  child: RaisedButton(
                    color: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Late",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            new ButtonBar(
              mainAxisSize: MainAxisSize
                  .min, // this will take space as minimum as posible(to center)
              children: <Widget>[
                ButtonTheme(
                  height: 50,
                  minWidth: 120,
                  child: RaisedButton(
                    color: Colors.grey[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Off Day",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 120,
                  child: RaisedButton(
                    color: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Holiday",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 120,
                  child: RaisedButton(
                    color: Colors.purple[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Leave",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            const ListTile(
              title: Text('Attendance Details',
                  style: TextStyle(color: Colors.grey)),
            ),
            Card(),
          ],
        ),
      ),
    );
  }
}
