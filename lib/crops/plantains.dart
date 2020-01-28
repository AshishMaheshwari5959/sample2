import 'package:flutter/material.dart';


class Cropplantains extends StatefulWidget {
  Cropplantains({Key key}) : super(key: key);

  @override
  _CropplantainsState createState() => _CropplantainsState();
}

class _CropplantainsState extends State<Cropplantains> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Analyzer'),
      ),
      body:ListView(
      children: <Widget>[
          Text(
            '\nPlantains',
            style :TextStyle(fontSize :30),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Image.network("https://www.google.com/imgres?imgurl=http%3A%2F%2Fwww.musarama.org%2Fupload%2Fhigh%2Fblsd-plantains.jpg&imgrefurl=http%3A%2F%2Fwww.musarama.org%2Fen%2Fimage%2Ffield-of-blsd-infected-plantains-125.html&docid=JufTxou3IatePM&tbnid=oZ_7IfL5AcuojM%3A&vet=10ahUKEwjixfa50ojnAhUHeisKHeNFA4sQMwhMKAAwAA..i&w=2048&h=1360&bih=706&biw=1536&q=plantains%20in%20field&ved=0ahUKEwjixfa50ojnAhUHeisKHeNFA4sQMwhMKAAwAA&iact=mrc&uact=8")
          ),
          Text("conditons:Plantains grow best in hot and humid climates, require a rainfall of at least 1000 mm (39.4 in) per year to survive and have a high light requirement. Plantains will grow optimally at 27°C (98.6°F) and require a deep soil, rich in organic matter which is well draining and well aerated.#uses: The most popular way to use green plantains is frying them into a tasty snack known as tostones, which are a staple of Latin American and Caribbean cuisine. Additionally, green plantains may be used to make: Baked plantain chips. pesticides: Chlorpyrifos Thiabendazole",
            style :TextStyle(fontSize :20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}