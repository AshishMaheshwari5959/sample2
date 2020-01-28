import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:sample2/auth.dart';
import 'package:sample2/auth_provider.dart';
import "package:firebase_database/firebase_database.dart";
//import 'package:sample2/location.dart';
//import 'package:sample2/location_service.dart';
//import 'package:sample2/user_location.dart';
import 'package:flutter/services.dart';
import 'package:sample2/utils/cropify.dart';

class EmailFieldValidator {
  static String validate(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    if (value.isNotEmpty) {
      if (value.length>=8) {
        if (!regex.hasMatch(value))
          return 'Password must contain a-z,A-Z,0-9 and special characters';
        else
          return null;
      } else {
        return 'Password must have 8 characters' ;
      }
    } else {
      return 'Password can\'t be empty' ;
    }
    //return 'Password is valid';
  }
}

class NameFieldValidator {
  static String validate(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }
}

class AddressFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Address can\'t be empty' : null;
  }
}

class NumberFieldValidator {
  static String validate(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if(value.length != 10){
      return "Mobile number must 10 digits";
    }else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({this.onSignedIn});
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

enum FormType {
  login,
  register,
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final nameController=TextEditingController();
  final passwordController=TextEditingController();
  final emailController=TextEditingController();
  final numberController=TextEditingController();
  final addressController=TextEditingController();

  String _email;
  String _password;
  FormType _formType = FormType.login;
  bool autoValidate=false;

  bool validateAndSave() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }else{
      setState(() {
        autoValidate = true;
      });
    }
    return false;
  }

  Future<void> validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        final BaseAuth auth = AuthProvider.of(context).auth;
        if (_formType == FormType.login) {
          final String userId = await auth.signInWithEmailAndPassword(_email, _password);
          print('Signed in: $userId');
        } else {
          //var userLocation = Provider.of<UserLocation>(context,listen: false);
          final String userId = await auth.createUserWithEmailAndPassword(_email, _password);
          var xyz = numberController.text ;
          //final DatabaseReference database = 
          FirebaseDatabase.instance.reference().child("Information").child('$xyz').set({
            'Name':nameController.text,
            'Address':addressController.text,
            'Phone Number':numberController.text,
            'Email':emailController.text,
            'Password':passwordController.text,
            //'Latitude': userLocation.latitude,
            //'Longitude': userLocation.longitude,
          });
          //print('lat: ${userLocation.latitude}');
          //print('long: ${userLocation.longitude}');
          print('Registered user: $userId');
        }
        widget.onSignedIn();
      } catch (e) {
        print('Error: $e');
        showDialog(
          context: context,
          builder: (context){
            return Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                elevation: 16,
                child: Container(
                  height: 200.0,
                  width: 100.0,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          "OOPS!!!!!\nError ocurred may be \n# you are not a registered user \n# your entered password is wrong\n# your entered mail ID is wrong",
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                      padding : EdgeInsets.symmetric(horizontal :25.0),
                      child : RaisedButton(
                        child: new Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),)
                    ],
                  ),
                ),
              );
            }); 
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
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
        title: Text(Cropify.name),
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
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidate: autoValidate,
          child: SingleChildScrollView(
            child : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildInputs() + buildSubmitButtons(),
          ),)
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    if (_formType == FormType.login) {
      return <Widget>[
        TextFormField(
          key: Key('email'),
          controller: emailController,
          decoration: InputDecoration(labelText: 'Email'),
          keyboardType: TextInputType.emailAddress,
          //maxLength: 32,
          validator: EmailFieldValidator.validate,
          onSaved: (String value) => _email = value,
        ),
        SizedBox(height: 10.0),
        TextFormField(
          key: Key('password'),
          controller: passwordController,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
          validator: PasswordFieldValidator.validate,
          onSaved: (String value) => _password = value,
        ),
        SizedBox(height: 30.0),
      ];
    }else{
      return <Widget>[
        TextFormField(
          key: Key('name'),
          controller: nameController,
          decoration: InputDecoration(
            labelText: 'NAME ',
            labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green))),
          validator: NameFieldValidator.validate,
        ),
        SizedBox(height: 10.0),
        TextFormField(
          key: Key('address'),
          controller: addressController,
          decoration: InputDecoration(
            labelText: 'ADDRESS ',
            labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green))),
          validator: AddressFieldValidator.validate,
        ),
        SizedBox(height: 10.0),
        TextFormField(
          key: Key('number'),
          controller: numberController,
          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'PHONE NUMBER ',
            labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green))),
          validator: NumberFieldValidator.validate,
        ),
        SizedBox(height: 10.0),
        TextFormField(
          key: Key('email'),
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          //maxLength: 32,
          decoration: InputDecoration(
            labelText: 'EMAIL',
            labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green))),
          validator: EmailFieldValidator.validate,
          onSaved: (String value) => _email = value,
        ),
        SizedBox(height: 10.0),
        TextFormField(
          key: Key('password'),
          controller: passwordController,
          decoration: InputDecoration(
            labelText: 'PASSWORD',
            labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green))),
          obscureText: true,
          validator: PasswordFieldValidator.validate,
          onSaved: (String value) => _password = value,
        ),
        SizedBox(height: 30.0),
      ];
    }
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return <Widget>[
        RaisedButton(
          key: Key('signIn'),
          child: Text('Login', style: TextStyle(fontSize: 20.0,color: Colors.white)),
          color: Colors.blue,
          highlightColor: Colors.grey,
          onPressed: validateAndSubmit,
        ),
        FlatButton(
          textColor: Colors.black,
          disabledTextColor: Colors.blueAccent,
          child: Text('Create an account', style: TextStyle(fontSize: 15.0)),
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return <Widget>[
        RaisedButton(
          child: Text('Create an account', style: TextStyle(fontSize: 20.0,color: Colors.white)),
          color: Colors.blue,
          highlightColor: Colors.grey,
          onPressed:() {
            try{
              validateAndSubmit();
              }catch(e){AlertDialog(
                title: new Text("Alert Dialog title"),
                content: new Text("Alert Dialog body"),
                actions: <Widget>[
                  FlatButton(
                    child: new Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            }
          } 
        ),
        FlatButton(
          textColor: Colors.black,
          disabledTextColor: Colors.blue,
          child: Text('Have an account? Login', style: TextStyle(fontSize: 15.0)),
          onPressed: moveToLogin,
        ),
      ];
    }
  }
}
