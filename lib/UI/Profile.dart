import 'package:befit_app/widgets/profileheader.dart';
import 'package:befit_app/widgets/userinfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static String routeName = "/profile";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final databaseRef = FirebaseDatabase.instance.reference();
  FirebaseAuth auth = FirebaseAuth.instance;
  var data;
  Future getuser() async {
    await databaseRef
        .child('Users')
        .child(auth.currentUser.uid)
        .once()
        .then((DataSnapshot snap) {
      data = snap.value;
      setState(() {});
    });
  }

  @override
  initState() {
    getuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProfileHeader(
                avatar: AssetImage('asset/login.png'),
                coverImage: AssetImage('asset/backimage.png'),
                title: data == null ? "User Name" : data['name'].toString(),
                actions: <Widget>[
                  MaterialButton(
                    color: Colors.white,
                    shape: CircleBorder(),
                    elevation: 0,
                    child: Icon(Icons.edit),
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              data == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : UserInformation(data['Longitude'].toString(), data['email'],
                      data['phone'], "About me in this section"),
            ],
          ),
        ));
  }
}
