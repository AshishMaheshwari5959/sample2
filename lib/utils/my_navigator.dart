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
}