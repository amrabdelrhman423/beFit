import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginOwner extends StatefulWidget {
  static String routeName = "/LoginOwner";

  @override
  _LoginAdminState createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginOwner> {
  var _formKey = GlobalKey<FormState>();
  bool _success;
  var emailvalue;
  var passwordvalue;

  Future<void> _auth() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailvalue, password: passwordvalue)
          .then((value) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeOwner()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        //    SnackBar(
        //   backgroundColor: Colors.black,
        //   content: Text(
        //     'Error occurred using Sign-In. Try again.',
        //     style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
        //   ),
        // );

      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();

    _auth();

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => Home()),
    // );
  }

  @override
  initState() {
    super.initState();
    getCurrentUserLocation();
  }

  double userLongitude;
  double userLatitude;

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

  var ispressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("LoginOwner"),
        backgroundColor: Colors.indigo.shade900,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Image.asset(
                'asset/login_owner.jpg',
                width: 1600,
                height: 160,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 20),
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 14),
                      child: Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                    ),
                    hintText: 'E-Mail',
                    hintStyle: TextStyle(fontSize: 18.0, color: Colors.grey)),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {},
                onChanged: (value) {
                  setState(() {
                    emailvalue = value.trim();
                  });
                },
                validator: (emailvalue) {
                  if (emailvalue.isEmpty) {
                    return 'This field is required';
                  }
                  if (!emailvalue.contains('@')) {
                    return " valid email should contain '@'";
                  }
                  if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(emailvalue)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 20),
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 14),
                      child: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 18.0, color: Colors.grey)),
                maxLength: 10,
                keyboardType: TextInputType.text,
                onFieldSubmitted: (value) {},
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    passwordvalue = value.trim();
                  });
                },
                validator: (passwordvalue) {
                  if (passwordvalue.isEmpty) {
                    return 'This field is required';
                  }
                  if (passwordvalue.length < 6) {
                    return 'Password should have at least 6 characters';
                  }

                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  // padding: EdgeInsets.only(bottom:102),
                  width: 150,

                  child: FloatingActionButton(
                    onPressed: () => {
                      _submit(),
                    },
                    child: Text(" Login",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: Colors.indigo.shade900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
