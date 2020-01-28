import 'package:flutter/material.dart';


class Croprice extends StatefulWidget {
  Croprice({Key key}) : super(key: key);

  @override
  _CropriceState createState() => _CropriceState();
}

class _CropriceState extends State<Croprice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Analyzer'),
      ),
      body:ListView(
      children: <Widget>[
          Text(
            '\nRice',
            style :TextStyle(fontSize :30),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Image.network("https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwiJgP_T0YjnAhV7xDgGHR5oB3IQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.connexionfrance.com%2FMag%2FFood-and-Drink%2FThe-paddy-fields-of-the-Camargue&psig=AOvVaw1POn2SO5cZUtMDk11DCTy9&ust=1579281891005231")
          ),
          Text(
            'conditions:average temperature during the growing season is between 20°C and 27°C.uses:Broken rice is used in brewing, distilling, and in the manufacture of starch and rice flour. Hulls are used for fuel, packing material, industrial grinding, fertilizer manufacture, and in the manufacture of an industrial chemical called furfural.pesticides:Carbaryl,Lambda-cyhalothrin,Malathion,zeta-cypermethrin',
            style :TextStyle(fontSize :20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}