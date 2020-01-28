import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:sample2/auth.dart';
import 'package:sample2/auth_provider.dart';
import 'package:sample2/crops/wheat.dart';
import 'package:sample2/location.dart';
import 'package:sample2/root_page.dart';
import 'package:sample2/splash_screen.dart';
import 'package:sample2/login_page.dart';
import 'package:sample2/intro_screen.dart';
import 'package:sample2/image_capture.dart';
import 'package:sample2/web_view.dart';

var routes = <String, WidgetBuilder>{
  "/root": (BuildContext context) =>RootPage(),
  "/login":(BuildContext context) =>LoginPage(),
  "/intro":(BuildContext context) =>IntroScreen(),
  "/image":(BuildContext context) =>ImageCapture(),
  "/wheat":(BuildContext context) =>Cropwheat(),
  "/location":(BuildContext context) =>Location(),
  "/web":(BuildContext context) =>WebViewExample(),
};

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        title: 'Flutter login demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: routes
      ),
    );
  }
}