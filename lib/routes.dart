import 'package:befit_app/UI/Login.dart';
import 'package:befit_app/UI/Onboarding.dart';
import 'package:befit_app/UI/Profile.dart';
import 'package:befit_app/UI/Splash.dart';
import 'package:befit_app/UI/detailsClasse.dart';
import 'package:befit_app/UI/detailsGym.dart';
import 'package:befit_app/UI/home.dart';
import 'package:befit_app/UI/qr_create_page.dart';
import 'package:befit_app/UI/register.dart';
import 'package:befit_app/UI/show.dart';
import 'package:befit_app/UI/showclasses.dart';
import 'package:befit_app/UI/PaymentScreen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  Splash.routeName: (context) => Splash(),
  Register.routeName: (context) => Register(),
  OnboardingScreen.routeName: (context) => OnboardingScreen(),
  Login.routeName: (context) => Login(),
  HomePage.routeName: (context) => HomePage(),
  Show.routeName: (context) => Show(),
  ProfilePage.routeName: (context) => ProfilePage(),
  ShowClasesPage.routeName: (context) => ShowClasesPage(),
  GymDetails.routeName: (context) => GymDetails(),
  PaymentScreen.routeName: (context) => PaymentScreen(),
  ClasseDetails.routeName: (context) => ClasseDetails(),
  QRCreatePage.routeName: (context) => QRCreatePage(),
};
