import 'package:befit_app/UI/Login.dart';
import 'package:befit_app/UI/Onboarding.dart';
import 'package:befit_app/UI/Profile.dart';
import 'package:befit_app/UI/Splash.dart';
import 'package:befit_app/UI/home.dart';
import 'package:befit_app/UI/register.dart';
import 'package:befit_app/UI/show.dart';
import 'package:befit_app/UI/showclasses.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  Splash.routeName: (context) => Splash(),
  Register.routeName: (context) => Register(),
  OnboardingScreen.routeName: (context) => OnboardingScreen(),
  Login.routeName: (context) => Login(),
  HomePage.routeName: (context) => HomePage(),
  Show.routeName: (context) => Show(),
  ProfilePage.routeName: (context) => ProfilePage(),
  ShowClasesPage.routeName: (context) => ShowClasesPage()
};
