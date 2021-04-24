import 'package:befit_app/size_config.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:befit_app/UI/PaymentScreen.dart';

class GymDetails extends StatefulWidget {
  static String routeName = '/Gymdetails';
  @override
  _GymDetailsState createState() => _GymDetailsState();
}

enum Booktype { day, week, month, year }

class _GymDetailsState extends State<GymDetails> {
  SwiperController _controller = SwiperController();
  int _currentIndex = 0;
  var routArg;
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm '),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('are you sure?\n'),
                Text('your booking is ${typebook} price is ${price}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('NO'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(PaymentScreen.routeName, arguments: {
                  'gym_Name': routArg['gym_Name'],
                  'typebook': typebook,
                  'price': price,
                });
              },
            ),
          ],
        );
      },
    );
  }

  Booktype type = Booktype.day;
  String typebook = "Day", price = "30 EGP";
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
                _showMyDialog();
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
          showSwipper(images: routArg['images'], gym_name: routArg['gym_Name']),
          Container(
            height: getProportionateScreenHeight(context, 0.5),
            child: ListView(
              children: [
                showDetails(description: routArg['description']),
                showTypeBook(),
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
                    children: <Widget>[Text(description)],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget showTypeBook() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(20),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "نوع الحجز ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Radio(
                        value: Booktype.day,
                        groupValue: type,
                        onChanged: (val) {
                          setState(() {
                            type = val;
                            typebook = "Day";
                            price = "30 EGP";
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                      Text("30 EGP "),
                      Text("Day")
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Radio(
                        value: Booktype.week,
                        groupValue: type,
                        onChanged: (val) {
                          setState(() {
                            type = val;
                            typebook = "Week";
                            price = "100 EGP";
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                      Text("100 EGP "),
                      Text("Week")
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Radio(
                        value: Booktype.month,
                        groupValue: type,
                        onChanged: (val) {
                          setState(() {
                            type = val;
                            typebook = "month";
                            price = "250 EGP";
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                      Text("250 EGP "),
                      Text("Month")
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Radio(
                        value: Booktype.year,
                        groupValue: type,
                        onChanged: (val) {
                          setState(() {
                            type = val;
                            typebook = "Year";
                            price = "1200 EGP";
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                      Text("1200 EGP "),
                      Text("Year")
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
