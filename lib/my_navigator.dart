import 'package:flutter/material.dart';

class MyNavigator {
  static void goToRoot(BuildContext context) {
    Navigator.pushNamed(context, "/root");
  }

  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, "/intro");
  }

  static void goToImage(BuildContext context) {
    Navigator.pushNamed(context, "/image");
  }

  static void goToWheat(BuildContext context) {
    Navigator.pushNamed(context, "/wheat");
  }

  static void goToLocation(BuildContext context) {
    Navigator.pushNamed(context, "/location");
  }

  static void goToPick(BuildContext context) {
    Navigator.pushNamed(context, "/pick");
  }

  static void goToWeb(BuildContext context) {
    Navigator.pushNamed(context, "/web");
  }
}