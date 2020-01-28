import 'package:flutter/material.dart';
import 'package:sample2/location_service.dart';
import 'package:sample2/home_view.dart';
import 'package:provider/provider.dart';
import 'package:sample2/user_location.dart';

class Location extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
        create: (context) => LocationService().locationStream,
        child: MaterialApp(title: 'Flutter Demo', home: HomeView()));
  }
}