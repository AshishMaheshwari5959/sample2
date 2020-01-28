import 'package:flutter/material.dart';


class Cropsoyabeans extends StatefulWidget {
  Cropsoyabeans({Key key}) : super(key: key);

  @override
  _CropsoyabeansState createState() => _CropsoyabeansState();
}

class _CropsoyabeansState extends State<Cropsoyabeans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Analyzer'),
      ),
      body:ListView(
      children: <Widget>[
          Text(
            '\nSoyabeans',
            style :TextStyle(fontSize :30),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Image.network("https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjpqZ6R0ojnAhURjuYKHSLWBuMQjRx6BAgBEAQ&url=https%3A%2F%2Ffarmtario.com%2Fnews%2Fnew-option-registered-for-dicamba-resistant-soybeans%2F&psig=AOvVaw1ZpfRaxqQrT6SdOgqQ1-49&ust=1579282011176306")
          ),
          Text(
            'conditions:Soybean plants can germinate when the soil temperature at a 2-inch depth is 50° F, but cooler temperatures can slow germination up to 3 weeks.uses:Soybeans are processed for their oil (see uses below) and meal (for the animal feed industry). A smaller percentage is processed for human consumption and made into products including soy milk, soy flour, soy protein, tofu and many retail food products. Soybeans are also used in many non-food (industrial) products.pesticides: glyphosate potassium salt,glyphosate isopropylamine salt,fomesafen sodium,chlorimuron ethy',
            style :TextStyle(fontSize :20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}