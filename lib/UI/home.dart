import 'package:befit_app/UI/show.dart';
import 'package:befit_app/widgets/drawerBeFit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/Home";
  String title;
  //  double screenHeight;
  //  double screenWidth;
  HomePage({Key key, this.title}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<HomePage> {
  double screenHeight;
  double screenWidth;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _buildGym(String image, String text, AlignmentGeometry alignmentDirectional) {
    return Stack(alignment: alignmentDirectional, children: [
      Container(
        height: 200,
        width: 200,
        child: FittedBox(
          fit: BoxFit.contain,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image(
              image: AssetImage(
                image,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    ]);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: DrwerBeFit(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Home Page',
            style: TextStyle(
                color: HexColor("#4042E2"), fontWeight: FontWeight.bold),
          ),

          backgroundColor: Colors.blue.withOpacity(0.1),
          // titleTextStyle: TextStyle(color: Colors.amber),
        ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Show.routeName);
                      },
                      child: _buildGym(
                          'asset/c29fb302-811a-474d-96d4-83d82634ce96.jpg',
                          'Gym',
                          Alignment.topLeft),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        print("go to class");
                      },
                      child: _buildGym(
                          'asset/a82ab5ec-a56f-4b7e-960b-7c182c796f8a.jpg',
                          'Class',
                          Alignment.bottomRight),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: 'Payment',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.point_of_sale_rounded),
              label: 'Points',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Store',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}
