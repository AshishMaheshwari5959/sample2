import 'package:flutter/material.dart';


class Cropsorghum extends StatefulWidget {
  Cropsorghum({Key key}) : super(key: key);

  @override
  _CropsorghumState createState() => _CropsorghumState();
}

class _CropsorghumState extends State<Cropsorghum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Analyzer'),
      ),
      body:ListView(
      children: <Widget>[
          Text(
            '\nSorghum',
            style :TextStyle(fontSize :30),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Image.network("https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.sorghumcheckoff.com%2Fassets%2Fmedia%2Fimages%2Fsorghumbeauty3.jpg&imgrefurl=https%3A%2F%2Fwww.sorghumcheckoff.com%2Fnews-and-media%2Fnewsroom%2F2018%2F10%2F19%2Fadding-sorghum-to-the-crop-mix-for-2019%2F&docid=t1J9hJvzFIpErM&tbnid=XEyJfF_bnFsXsM%3A&vet=10ahUKEwioz_OZ0ojnAhWRXSsKHd02D2kQMwh1KAYwBg..i&w=830&h=553&bih=706&biw=1536&q=sorghum%20in%20field&ved=0ahUKEwioz_OZ0ojnAhWRXSsKHd02D2kQMwh1KAYwBg&iact=mrc&uact=8")
          ),
          Text('conditions:Sorghum can be grown successfully on clay, clay loam, or sandy loam soils. Fertile, well-drained soils are important to optimize yield.uses:Sorghum is used for food, fodder, and the production of alcoholic beverages. It is drought-tolerant and heat-tolerant, and is especially important in arid regionspesticides:Cheminova Malathion 57EC,Coragen, Dimethoate 4E',
            style :TextStyle(fontSize :20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}