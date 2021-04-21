import 'package:befit_app/UI/Profile.dart';
import 'package:flutter/material.dart';

class DrwerBeFit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), topRight: Radius.circular(100)),
        child: Drawer(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.all(10),
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.orange,
                                    child: Text(
                                      "A",
                                      style: TextStyle(fontSize: 40.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Amr Abdelrahman",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                )
                              ],
                            ),
                          ),
                        ]),
                    ListTile(
                      title: Text(
                        "Home",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        "My Profile",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, ProfilePage.routeName);
                      },
                    ),
                    ListTile(
                      title: Text(
                        "Points",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        "Log Out",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
