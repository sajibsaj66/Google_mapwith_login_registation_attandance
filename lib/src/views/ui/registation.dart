import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:interview/src/views/utils/contants.dart';

import 'home.dart';

class Registation extends StatefulWidget {
  @override
  _GogleMapScreenState createState() => _GogleMapScreenState();
}

class _GogleMapScreenState extends State<Registation> {
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
            return IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(right: 48.0),
                child: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                  size: 25,
                ),
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
          "Registration",
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
                      "    Attendance Point ",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )),
            Container(
              width: 370.0,
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  border: Border.all(color: Colors.blueGrey)),
              child: DropdownButton<String>(
                hint: Text(
                  "Select",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                items: <String>[
                  '',
                  'Not Found',
                  // 'Chating',
                  // 'No Longer Interested',
                  // 'Document Request'
                ].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
            Container(
                height: 50,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Text(
                      "    My Location",
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
                              child: Padding(
                                padding: const EdgeInsets.only(left: 138.0),
                                child: Text(
                                  '  submit ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        )))),
            SizedBox(
              height: 20,
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
