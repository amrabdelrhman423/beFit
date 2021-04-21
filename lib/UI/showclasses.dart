import 'package:befit_app/widgets/classitem.dart';
import 'package:flutter/material.dart';

class ShowClasesPage extends StatefulWidget {
  static String routeName = "/clasess";
  @override
  _ShowClasesPageState createState() => _ShowClasesPageState();
}

class _ShowClasesPageState extends State<ShowClasesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(color: Colors.grey[300]
              // image: DecorationImage(
              //     image: AssetImage('asset/backimage.png'), fit: BoxFit.cover)
              ),
          child: ListView(
            children: <Widget>[
              Classitem(
                  "Zomba",
                  "https://ichef.bbci.co.uk/news/976/cpsprodpb/C05C/production/_113744294_gettyimages-1183038884.jpg",
                  "details"),
              Classitem(
                  "Boxing",
                  "https://ichef.bbci.co.uk/news/976/cpsprodpb/C312/production/_115083994_gym2.jpg",
                  "details"),
              Classitem(
                  "Run",
                  "https://previews.123rf.com/images/tonobalaguer/tonobalaguer1405/tonobalaguer140500178/28672021-zumba-dance-cardio-people-group-training-at-fitness-gym-workout-exercise.jpg",
                  "details"),
            ],
          ),
        ),
      ),
    );
  }
}
