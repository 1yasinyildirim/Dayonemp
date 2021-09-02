import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:location/location.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dayonemp/login/register.dart';

var location = new Location();

class Konum extends StatefulWidget {
  Konum({Key? key}) : super(key: key);

  @override
  _KonumState createState() => _KonumState();
}

class _KonumState extends State<Konum> {
  Completer<GoogleMapController> _controller = Completer();

  List<Marker> markers = [
    Marker(
        markerId: MarkerId('first place'),
        infoWindow: InfoWindow(title: 'bu yer çok iyi'),
        position: LatLng(36.8637, 37.2433)),
    Marker(
        markerId: MarkerId('first place'),
        infoWindow: InfoWindow(title: 'bu yer çok iyi'),
        position: LatLng(36.9637, 37.2833)),
    Marker(
        markerId: MarkerId('first place'),
        infoWindow: InfoWindow(title: 'bu yer çok iyi'),
        position: LatLng(36.9637, 37.3433)),
    Marker(
        markerId: MarkerId('first place'),
        infoWindow: InfoWindow(title: 'bu yer çok iyi'),
        position: LatLng(36.9237, 38.2433)),
    Marker(
        markerId: MarkerId('first place'),
        infoWindow: InfoWindow(title: 'bu yer çok iyi'),
        position: LatLng(36.9697, 38.2433)),
  ];

  static final CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(38.9637, 35.2433), zoom: 14.4746);

  bool? _serviceEnabled;

  LocationData? _location;

  PermissionStatus? _permissionGranted;

  @override
  Widget build(BuildContext context) {
    void checkLocation() async {
      Location location = new Location();

      _serviceEnabled = await location.serviceEnabled();

      if (_serviceEnabled!) {
        _permissionGranted = await location.hasPermission();

        if (_permissionGranted == PermissionStatus.granted) {
          _location = await location.getLocation();

          print(_location!.latitude.toString() +
              " " +
              _location!.longitude.toString());

          location.onLocationChanged.listen((LocationData currentLocation) {
            print(currentLocation.latitude.toString() +
                " " +
                currentLocation.longitude.toString());
          });
        } else {
          _permissionGranted = await location.requestPermission();

          if (_permissionGranted == PermissionStatus.granted) {
            print('user allowed');
          } else {
            SystemNavigator.pop();
          }
        }
      } else {
        _serviceEnabled = await location.requestService();

        if (_serviceEnabled!) {
          _permissionGranted = await location.hasPermission();

          if (_permissionGranted == PermissionStatus.granted) {
            print('user allowed before');
          } else {
            _permissionGranted = await location.requestPermission();

            if (_permissionGranted == PermissionStatus.granted) {
              print('user allowed');
            } else {
              SystemNavigator.pop();
            }
          }
        } else {
          SystemNavigator.pop();
        }
      }
    }

    /*storeUserLocation() {
      Location location = new Location();

      location.onLocationChanged.listen((LocationData currentLocation) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .set({
          'name': 'Eyad',
          'location':
              GeoPoint(currentLocation.latitude, currentLocation.longitude)
        });
      });
    }*/

    return Scaffold(
        body: Stack(
      children: [
        //Positioned(

        //child: Slider
        //(
        //onChanged: (value) => {},
        //),
        //),
        GoogleMap(
          mapType: MapType.normal,
          buildingsEnabled: true,
          initialCameraPosition:
              CameraPosition(target: LatLng(38.9637, 35.2433), zoom: 14.4746),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: markers.toSet(),
        ),
      ],
    ));
  }
}

void displayBottomSheet(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      context: context,
      builder: (ctx) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              Container(
                  child: Center(
                      child: Container(
                color: Colors.grey,
                width: 50,
                height: 3,
                margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
              ))),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 2,
                          color: Colors.pink.shade900,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                    ),
                    //color: Colors.grey.shade100,
                    //shadowColor: Colors.black,
                    margin: EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: IconButton(
                              icon: Icon(LineIcons.mapMarker,
                                  color: Colors.amber),
                              onPressed: onPressed),
                          title: Text(
                            'İş İlanı',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            '300m mesafede',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

void onPressed() {}
