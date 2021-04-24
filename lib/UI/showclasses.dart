import 'package:befit_app/UI/detailsClasse.dart';
import 'package:befit_app/widgets/classitem.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:maps_toolkit/maps_toolkit.dart';

class ShowClasesPage extends StatefulWidget {
  static String routeName = "/clasess";
  @override
  _ShowClasesPageState createState() => _ShowClasesPageState();
}

class _ShowClasesPageState extends State<ShowClasesPage> {
  DatabaseReference databaseRef = FirebaseDatabase.instance.reference();
  var userLatitude, userLongitude;

  List<dynamic> classes = [];
  var data;

  Future getclasses() async {
    await databaseRef.child('classes').once().then((DataSnapshot snap) {
      print(snap.value);
      data = snap.value;

      data.forEach((k, v) {
        var distanceBetweenPoints = SphericalUtil.computeDistanceBetween(
            LatLng(v['latitude'], v['longitude']),
            LatLng(userLatitude, userLongitude));
        if (distanceBetweenPoints.toInt() < 10000) {
          classes.add(v);
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
    super.initState();
    getCurrentUserLocation();
    getclasses();
  }

  @override
  Widget build(BuildContext context) {
    if (classes.isNotEmpty) {
      print(classes);
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Nearby Classes"),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(color: Colors.grey[300]),
          child: ListView.builder(
            itemCount: classes.length,
            itemBuilder: (context, index) {
              return classes == null
                  ? CircularProgressIndicator()
                  : InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ClasseDetails.routeName,
                            arguments: {
                              'class_Name': classes[index]['class_Name'],
                              'images': classes[index]['images'],
                              'date': classes[index]['date'],
                              'price': classes[index]['price'],
                              "gym_name": classes[index]['gym_name']
                            });
                      },
                      child: Classitem(classes[index]['class_Name'],
                          classes[index]['img'], classes[index]['gym_name']),
                    );
            },
          ),
        ),
      ),
    );
  }
}
