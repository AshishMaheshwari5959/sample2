import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sample2/auth.dart';

import 'package:sample2/auth_provider.dart';
//import 'package:sample2/image_capture.dart';
import 'package:sample2/my_navigator.dart';

class HomePage extends StatelessWidget {

  const HomePage({this.onSignedOut});
  final VoidCallback onSignedOut;

  Future<void> _signOut(BuildContext context) async {
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

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
    return Scaffold(
      appBar: AppBar(
        title: Text('CROPIFY'),
        actions: <Widget>[
          FlatButton(
            child: Text('Logout', style: TextStyle(fontSize: 15.0, color: Colors.white)),
            onPressed: () => _signOut(context),
          ),
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
          ),
          
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            /* FloatingActionButton.extended(
              label:Text('WELCOME'), 
              onPressed: () => MyNavigator.goToImage(context),
              
            ), */
            Text('WELCOME!!!',style: TextStyle(fontSize: 50,color: Colors.blue),textAlign: TextAlign.left,),
            Text('You are just one more step away from using our feature.',style: TextStyle(fontSize: 30,color: Colors.blue),textAlign: TextAlign.left,),
            Image.network('https://image.freepik.com/free-photo/woman-farmer-using-technology-mobile-corn-field_34152-1337.jpg'),
            FloatingActionButton.extended(
              label:Text('CONTINUE'), 
              onPressed: () => MyNavigator.goToLocation(context),
              
            ),
          ]
        )
        //Center(child: Text('Welcome', style: TextStyle(fontSize: 32.0))),
      ),
    );
  }
}