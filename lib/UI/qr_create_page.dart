import 'package:barcode_widget/barcode_widget.dart';
import 'package:befit_app/UI/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class QRCreatePage extends StatefulWidget {
  static String routeName = "/qrScreen";
  @override
  _QRCreatePageState createState() => _QRCreatePageState();
}

class _QRCreatePageState extends State<QRCreatePage> {
  final controller = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("your QRCode for booking"),
          leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, HomePage.routeName)),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  data: auth.currentUser.uid,
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Take Screen shot for your QRCode")],
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      );
}
