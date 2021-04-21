import 'package:befit_app/UI/show.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeOwner extends StatefulWidget {
  static String routeName = "/HomeOwner";
  @override
  _HomeOwnerState createState() => _HomeOwnerState();
}

class _HomeOwnerState extends State<HomeOwner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: GestureDetector(
          child: Text("you are in HomeOwner  show gyms?",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Show()),
            );
          }),
    );
  }
}
