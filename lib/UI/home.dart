import 'package:befit_app/UI/show.dart';
import 'package:befit_app/UI/showclasses.dart';
import 'package:befit_app/size_config.dart';
import 'package:befit_app/widgets/drawerBeFit.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/Home";
  String title;

  HomePage({Key key, this.title}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<HomePage> {
  double screenHeight;
  double screenWidth;
  int _selectedIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrwerBeFit(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home Page',
          style: TextStyle(
              color: HexColor("#4042E2"), fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu_open,
            color: Colors.grey[800],
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),

        backgroundColor: Colors.white,
        // titleTextStyle: TextStyle(color: Colors.amber),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'asset/backimage.png',
                ),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ShowClasesPage.routeName);
                    },
                    child: _buildGym(
                        'asset/a82ab5ec-a56f-4b7e-960b-7c182c796f8a.jpg',
                        'Classes',
                        Alignment.bottomRight),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 5,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 500),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.point_of_sale_outlined,
                    text: 'Points',
                  ),
                  GButton(
                    icon: Icons.store,
                    text: 'Store',
                  ),
                  GButton(
                    icon: Icons.payment,
                    text: 'Payment',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                    print(_selectedIndex);
                  });
                }),
          ),
        ),
      ),
      //  BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.payment),
      //       label: 'Payment',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.point_of_sale_rounded),
      //       label: 'Points',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.store),
      //       label: 'Store',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: _onItemTapped,
      // )
    );
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
}
