import 'package:befit_app/UI/Login.dart';
import 'package:befit_app/UI/register.dart';
import 'package:befit_app/widgets/intro_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class OnboardingScreen extends StatefulWidget {
  static String routeName = "/OnboardingScreen";

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  SwiperController _controller = SwiperController();
  int _currentIndex = 0;
  final List<String> titles = [
    "Welcome",
    "Be Fit App",
    "Classes in gym",
  ];
  final List<String> subtitles = [
    "Welcome to \n Be FiT  ",
    " APP can booking \n the gym near you",
    "APP can booking classes in gyms "
  ];
  final List<Color> colors = [
    Colors.black38,
    Colors.black45,
    Colors.black54,
  ];
  final List<String> images = [
    "asset/image2.jpg",
    "asset/image4.jpg",
    "asset/image9.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Swiper(
            loop: false,
            index: _currentIndex,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _controller,
            pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                activeColor: Colors.blue,
                activeSize: 20.0,
              ),
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return IntroItem(
                  title: titles[index],
                  subtitle: subtitles[index],
                  bg: colors[index],
                  imageUrl: images[index]);
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FlatButton(
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Register()));
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Icon(
                _currentIndex == 2 ? Icons.check : Icons.arrow_forward,
                color: Colors.white,
              ),
              onPressed: () {
                if (_currentIndex != 2)
                  _controller.next();
                else
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Register()));
              },
            ),
          )
        ],
      ),
    );
  }
}
