import 'dart:convert';

import 'package:befit_app/widgets/gymitem.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps_toolkit/maps_toolkit.dart';

class Show extends StatefulWidget {
  static String routeName = "/Show";

  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {
  var data, d;
  List<dynamic> gyms = [];

  final databaseRef = FirebaseDatabase.instance.reference();

  Future getGyms() async {
    await databaseRef.once().then((DataSnapshot snap) {
      data = snap.value;
      d = snap;

      data['images'].forEach((k, v) {
        var distanceBetweenPoints = SphericalUtil.computeDistanceBetween(
            LatLng(v['latitude'], v['longitude']),
            LatLng(30.9789098, 31.1939278));

        if (distanceBetweenPoints.toInt() < 10000) {
          gyms.add(v);
        }
      });
      setState(() {});
    });
  }

  @override
  initState() {
    // printFirebase();
    super.initState();
    getGyms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Show gyms"),
          backgroundColor: Colors.indigo.shade900,
        ),
        backgroundColor: Colors.white,
        body: data == null
            ? Center(
                child: CircularProgressIndicator(),
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
                    return GymItem(gyms[index]['img'], gyms[index]['gym_Name']);
                  },
                )));
  }
}
