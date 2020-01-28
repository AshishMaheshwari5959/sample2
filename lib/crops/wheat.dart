import 'package:flutter/material.dart';


class Cropwheat extends StatefulWidget {
  Cropwheat({Key key}) : super(key: key);

  @override
  _CropwheatState createState() => _CropwheatState();
}

class _CropwheatState extends State<Cropwheat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Analyzer'),
      ),
      body:ListView(
      children: <Widget>[
          Text(
            '\nWheat',
            style :TextStyle(fontSize :30),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Image.network("https://5.imimg.com/data5/NR/BA/MY-17256771/wheat-500x500.jpg")
          ),
          Text(
            'conditions:a sunny position in a rich well-drained soil.uses:Wheat is typically milled into flour which is then used to make a wide range of foods including bread, crumpets, muffins, noodles, pasta, biscuits, cakes, pastries, cereal bars, sweet and savoury snack foods, crackers, crisp-breads, sauces and confectionery (e.g. liquorice).pesticides:Malathion,Chlorpyrifos methyl,Methoxychlor p,p',
            style :TextStyle(fontSize :20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}