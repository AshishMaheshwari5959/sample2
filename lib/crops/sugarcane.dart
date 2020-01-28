import 'package:flutter/material.dart';


class Cropsugarcane extends StatefulWidget {
  Cropsugarcane({Key key}) : super(key: key);

  @override
  _CropsugarcaneState createState() => _CropsugarcaneState();
}

class _CropsugarcaneState extends State<Cropsugarcane> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Analyzer'),
      ),
      body:ListView(
      children: <Widget>[
          Text(
            '\nSugarcane',
            style :TextStyle(fontSize :30),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Image.network("https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjBj6mv0ojnAhVE4XMBHYj1DEUQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.agefotostock.com%2Fage%2Fen%2FStock-Images%2FRights-Managed%2FDPA-NMK-38265&psig=AOvVaw2C5Ee-aL4lvEnClGD_wpV0&ust=1579282070379756")
          ),
          Text('conditions:A long, warm growing season with a high incidence of solar radiation and adequate moisture (rainfall) - the plant uses from 148 to 300g of water to produce 1.0g of dry substance.uses:By products of sugar production is used as agricultural mulch and paper production. Sugarcane has medicinal properties and used in Indian Ayurvedic Medicine. Sugarcane juice is used to make ethanol and alcoholic beverages such as rum. Ethanol obtained from sugarcane is now widely used as a biofuel.pesticides:Ametryn,Atrazine,MSMA,MCPA, Glyphosate',
            style :TextStyle(fontSize :20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}