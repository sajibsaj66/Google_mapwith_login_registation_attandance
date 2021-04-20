// import 'package:flutter/material.dart';
// import 'package:interview/src/views/utils/contants.dart';
//
// import 'home.dart';
//
// class CheckInOut extends StatefulWidget {
//   @override
//   _CheckInOutState createState() => _CheckInOutState();
// }
//
// class _CheckInOutState extends State<CheckInOut> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kWhiteColor,
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(
//                 Icons.arrow_back_outlined,
//                 color: Colors.black,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Home()),
//                 );
//               },
//             );
//           },
//         ),
//         centerTitle: true,
//         title: Text(
//           "Check in/out..",
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:interview/src/views/utils/contants.dart';

import 'home.dart';
import 'login.dart';

class GogleMapScreen extends StatefulWidget {
  @override
  _GogleMapScreenState createState() => _GogleMapScreenState();
}

class _GogleMapScreenState extends State<GogleMapScreen> {
  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "images/map_icon.png");
  }

  void _onMapCreated(GoogleMapController controller) {
    //controller.setMapStyle(Utils.Mapstyle);
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(22.5448131, 88.3403691),
          icon: mapMarker,
          infoWindow: InfoWindow(
              title: "Victoria Mrmorial", snippet: 'A Historical Place')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        leading: Builder(
          builder: (BuildContext context) {
            return FlatButton(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(58.0)),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
            );
          },
        ),
        centerTitle: true,
        title: Text(
          "Check in/out..",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 50,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Text(
                      "  Today",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 245,
                    ),
                    Text(
                      "Sun April 18 2021",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )),
            Container(
                height: 50,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Text(
                      "  My Location",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )),
            Container(
              height: 200,
              width: 400,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                markers: _markers,
                initialCameraPosition: CameraPosition(
                  target: LatLng(22.5448131, 88.3403691),
                  zoom: 15,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 380,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    onPressed: () {
                      print('Button Clicked.');
                    },
                    textColor: Colors.white,
                    color: Colors.green[800],
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                              child: Text(
                                '                                CHECK IN ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(4, 0, 10, 0),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.exit_to_app_sharp,
                                    color: kBlackColor,
                                  ),
                                  onPressed: () async {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()),
                                        (route) => false);
                                  }),
                            ),
                          ],
                        )))),
            SizedBox(
              height: 20,
            ),
            Card(
              child: Container(
                  height: 50,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "  Check In",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.green[500],
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 260,
                      ),
                      Text(
                        "Check Out ",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.red[800],
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

// class Utils {
//   static String Mapstyle = '''
//   [
//   {
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#f5f5f5"
//       }
//     ]
//   },
//   {
//     "elementType": "labels.icon",
//     "stylers": [
//       {
//         "visibility": "off"
//       }
//     ]
//   },
//   {
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#616161"
//       }
//     ]
//   },
//   {
//     "elementType": "labels.text.stroke",
//     "stylers": [
//       {
//         "color": "#f5f5f5"
//       }
//     ]
//   },
//   {
//     "featureType": "administrative.land_parcel",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#bdbdbd"
//       }
//     ]
//   },
//   {
//     "featureType": "poi",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#eeeeee"
//       }
//     ]
//   },
//   {
//     "featureType": "poi",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#757575"
//       }
//     ]
//   },
//   {
//     "featureType": "poi.park",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#e5e5e5"
//       }
//     ]
//   },
//   {
//     "featureType": "poi.park",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#9e9e9e"
//       }
//     ]
//   },
//   {
//     "featureType": "road",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#ffffff"
//       }
//     ]
//   },
//   {
//     "featureType": "road.arterial",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#757575"
//       }
//     ]
//   },
//   {
//     "featureType": "road.highway",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#dadada"
//       }
//     ]
//   },
//   {
//     "featureType": "road.highway",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#616161"
//       }
//     ]
//   },
//   {
//     "featureType": "road.local",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#9e9e9e"
//       }
//     ]
//   },
//   {
//     "featureType": "transit.line",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#e5e5e5"
//       }
//     ]
//   },
//   {
//     "featureType": "transit.station",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#eeeeee"
//       }
//     ]
//   },
//   {
//     "featureType": "water",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#c9c9c9"
//       }
//     ]
//   },
//   {
//     "featureType": "water",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#9e9e9e"
//       }
//     ]
//   }
// ]
//   ''';
// }
