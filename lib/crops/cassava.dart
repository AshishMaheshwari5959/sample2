import 'package:flutter/material.dart';


class Cropcassava extends StatefulWidget {
  Cropcassava ({Key key}) : super(key: key);

  @override
  _CropcassavaState createState() => _CropcassavaState();
}

class _CropcassavaState extends State<Cropcassava> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Analyzer'),
      ),
      body:ListView(
      children: <Widget>[
          Text(
            '\nCassava',
            style :TextStyle(fontSize :30),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Image.network("https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjx-fOA0ojnAhVsILcAHZzuDOsQjRx6BAgBEAQ&url=https%3A%2F%2Faltusimpact.com%2Fprojects%2Fcassava-agroforestry%2F&psig=AOvVaw2AgFaNiRHAlO8Uwf7QiNKX&ust=15792819856532764")
          ),
          Text(
            'conditions:humid-warm climates at temperatures of between 25 - 29°C and precipitations of between 1000 - 1500 mm \n uses:Cassava is a root vegetable. People use the root as a food and to make medicine. Cassava is used for tiredness, dehydration in people with diarrhea, sepsis, and to induce labor, but there is no good scientific evidence to support these uses. Cassava root and leaves are eaten as food.pesticides:polychlorinated biphenyl (PCB),Nitrate (NO3),Hydrogen sulphide (H2S)',
            style :TextStyle(fontSize :20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}