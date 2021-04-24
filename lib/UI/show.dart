import 'package:befit_app/UI/detailsGym.dart';
import 'package:befit_app/widgets/gymitem.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:maps_toolkit/maps_toolkit.dart';

class Show extends StatefulWidget {
  static String routeName = "/Show";

  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {
  var data, d;
  List<dynamic> gyms = [];
  var userLatitude, userLongitude;

  DatabaseReference databaseRefgym = FirebaseDatabase.instance.reference();

  Future getGyms() async {
    await databaseRefgym.child('images').once().then((DataSnapshot snap) {
      print(snap.value);
      data = snap.value;
      d = snap;

      data.forEach((k, v) {
        var distanceBetweenPoints = SphericalUtil.computeDistanceBetween(
            LatLng(v['latitude'], v['longitude']),
            LatLng(userLatitude, userLongitude));
        if (distanceBetweenPoints.toInt() < 10000) {
          gyms.add(v);
        }
      });
      setState(() {});
    });
  }

  getCurrentUserLocation() async {
    dynamic currentLocation = LocationData;

    var error;

    var location = new Location();

    try {
      currentLocation = await location.getLocation();
      userLatitude = currentLocation.latitude;
      userLongitude = currentLocation.longitude;
      print(userLongitude);
      print(userLatitude);
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      }
      currentLocation = null;
    }
  }

  @override
  initState() {
    // printFirebase();
    getCurrentUserLocation();
    getGyms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Show gyms"),
          backgroundColor: Colors.indigo.shade900,
        ),
        backgroundColor: Colors.white,
        body: data == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : data == []
                ? Center(
                    child: Text("لا يوجد"),
                  )
                : Padding(
                    padding: const EdgeInsets.all(4),
                    child: GridView.builder(
                      primary: false,
                      padding: const EdgeInsets.all(4),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      itemCount: gyms.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, GymDetails.routeName,
                                arguments: {
                                  'gym_Name': gyms[index]['gym_Name'],
                                  'images': gyms[index]['images'],
                                  'description': gyms[index]['description'],
                                });
                          },
                          child: GymItem(
                              gyms[index]['img'], gyms[index]['gym_Name']),
                        );
                      },
                    )));
  }
}
