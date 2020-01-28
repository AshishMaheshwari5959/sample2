import 'package:flutter/material.dart';


class Croptobacco extends StatefulWidget {
  Croptobacco({Key key}) : super(key: key);

  @override
  _CroptobaccoState createState() => _CroptobaccoState();
}

class _CroptobaccoState extends State<Croptobacco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Analyzer'),
      ),
      body:ListView(
      children: <Widget>[
          Text(
            '\nTobacco',
            style :TextStyle(fontSize :30),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Image.network("https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwi2odHH0ojnAhWZ7HMBHYJFBL8QjRx6BAgBEAQ&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Ftobacco-field&psig=AOvVaw0Xp5waVahyMqqEb9zWHYPQ&ust=1579282131254659")
          ),
          Text(
            " conditions : a climate that's dry and warm. Tobacco requires a frost-free period of 3 to 4 months between transplant and harvest. #uses: Dried tobacco leaves are mainly used for smoking in cigarettes, cigars as well as pipes and shishas . They can also be consumed as snuff, chewing tobacco, dipping tobacco and snus. Tobacco use is a risk factor for many diseases; especially those affecting the heart, liver, and lungs, as well as many cancers. #pesticides: Aldicarb ChlorMethyl bromide",
            style :TextStyle(fontSize :20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}