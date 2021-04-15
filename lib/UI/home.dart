import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  static String routeName = "/Home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Home"),
    );
  }
}
