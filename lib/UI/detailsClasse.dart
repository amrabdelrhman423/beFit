import 'package:befit_app/UI/paymentScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../size_config.dart';

class ClasseDetails extends StatefulWidget {
  static String routeName = "/classe";
  @override
  _ClasseDetailsState createState() => _ClasseDetailsState();
}

SwiperController _controller = SwiperController();

int _currentIndex = 0;

class _ClasseDetailsState extends State<ClasseDetails> {
  var routArg;
  @override
  Widget build(BuildContext context) {
    routArg = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    return Scaffold(
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 25,
            right: 0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, PaymentScreen.routeName,
                    arguments: {
                      'gym_Name': routArg['gym_name'],
                      'typebook': routArg['class_Name'],
                      'price': routArg['price'],
                    });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    "Book",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          showSwipper(
              images: routArg['images'], gym_name: routArg['class_Name']),
          Container(
            height: getProportionateScreenHeight(context, 0.5),
            child: ListView(
              children: [
                showDetails(
                    description: (routArg['date'] + "\n  " + routArg['price'])),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget showSwipper({Map<dynamic, dynamic> images, String gym_name}) {
    List<dynamic> listimage = [];
    images.forEach((key, value) {
      listimage.add(value);
    });
    return Container(
      height: getProportionateScreenHeight(context, 0.4),
      child: Swiper(
        loop: true,
        index: _currentIndex,
        onIndexChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _controller,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.black,
            activeSize: 20.0,
          ),
        ),
        itemCount: listimage.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(listimage[index]), fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.1),
                  ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    gym_name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget showDetails({String description}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 10,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        description,
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
