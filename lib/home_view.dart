import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sample2/image_capture.dart';
//import 'package:sample2/my_navigator.dart';
import 'package:sample2/user_location.dart';
import 'package:provider/provider.dart';
//import 'package:sample2/web_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  Future<void> dialoghelp(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
         title: Text('Help'),
          content: const Text('Contact Pseudo Nerds\nm27sanjay@gmail.com'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> dialogabout(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
         title: Text('About'),
          content: const Text('APK versio XXXXX\nTEXT\ntext'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    print('Location: Lat:${userLocation.latitude}, Long: ${userLocation.longitude}');
    FirebaseDatabase.instance.reference().child("location").child('ID').set({
        'Latitude': userLocation.latitude ,
        'Longitude': userLocation.longitude ,
    });
    return Scaffold(
      appBar: AppBar(
        title:Text('CROPIFY'),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (context) {
            var list = List<PopupMenuEntry<Object>>();
            list.add(
              PopupMenuItem(
                child: FlatButton(
                  textColor: Colors.black,
                  disabledTextColor: Colors.blueAccent,
                  child: Text('EXIT', style: TextStyle(fontSize: 15.0),textAlign: TextAlign.right,),
                  onPressed:() => exit(0),
                ),
                value: 1,
              ),
            );
            list.add(
              PopupMenuItem(
                child: FlatButton(
                  textColor: Colors.black,
                  disabledTextColor: Colors.blueAccent,
                  child: Text('Help', style: TextStyle(fontSize: 15.0),textAlign: TextAlign.right,),
                  onPressed:(){ dialoghelp(context);},
                ),
                value: 2,
              ),
            );
            list.add(
              PopupMenuItem(
                child: FlatButton(
                  textColor: Colors.black,
                  disabledTextColor: Colors.blueAccent,
                  child: Text('About', style: TextStyle(fontSize: 15.0,),textAlign: TextAlign.right,),
                  onPressed:(){ dialogabout(context);},
                ),
                value: 3,
                height: 50,
              ),
            );
            return list;
          },
          elevation: 7,
          padding: EdgeInsets.symmetric(horizontal: 10),          
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text:'Press the\n',
                style: TextStyle(fontSize:30,color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text:'"Proceed"\n',style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text:'button below for clicking or uploading your crop field image',style: TextStyle(fontSize:30)),
                ]
              ),
            ),
            
            FloatingActionButton.extended(
              label:Text('PROCEED'), 
              onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> ImageCapture())),
              
            ),
          ]
        )
      ),
    );
  }
}