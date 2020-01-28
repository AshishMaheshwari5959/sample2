import 'package:flutter/material.dart';


class Cropcorn extends StatefulWidget {
  Cropcorn({Key key}) : super(key: key);

  @override
  _CropcornState createState() => _CropcornState();
}

class _CropcornState extends State<Cropcorn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Analyzer'),
      ),
      body:ListView(
      children: <Widget>[
          Text(
            '\nCorn',
            style :TextStyle(fontSize :30),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Image.network("https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.britannica.com%2F36%2F167236-050-BF90337E%2FEars-corn.jpg&imgrefurl=https%3A%2F%2Fwww.britannica.com%2Fplant%2Fcorn-plant&docid=W1wJVxOqWU0Z7M&tbnid=WXZ9LItNwnBsZM%3A&vet=10ahUKEwiK5Ies0YjnAhWRXCsKHU47BgYQMwh6KAEwAQ..i&w=1600&h=1200&bih=706&biw=1536&q=corn&ved=0ahUKEwiK5Ies0YjnAhWRXCsKHU47BgYQMwh6KAEwAQ&iact=mrc&uact=8")
          ),
          Text(
            'Wheather conditions:sunny weather, rich, moist soil,soil temperature ranges between 60 and 65 degrees Fahrenheit.uses:Corn can be used for food as corn flour, cornmeal, hominy, grits or sweet corn. It can be used as animal feed to help fatten our hogs, chickens and cattle. And it can be turned into ethanol, high-fructose corn syrup or even bio-based plastics.pesticides:Nitrogen (N), Phosphate (P2O5),Potash (K2O),Sulfur (S)',
            style :TextStyle(fontSize :20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}