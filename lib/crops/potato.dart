import 'package:flutter/material.dart';


class Croppotatoes extends StatefulWidget {
  Croppotatoes ({Key key}) : super(key: key);

  @override
  _CroppotatoesState createState() => _CroppotatoesState();
}

class _CroppotatoesState extends State<Croppotatoes > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Analyzer'),
      ),
      body:ListView(
      children: <Widget>[
          Text(
            '\nPotatoes ',
            style :TextStyle(fontSize :30),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Image.network("https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwj634vs0YjnAhVPIbcAHZ5qD58QjRx6BAgBEAQ&url=https%3A%2F%2Fcreativemarket.com%2Fnednapa%2F2603924-potatoes-in-the-field&psig=AOvVaw0uw79DUgJUBTqnp5rvsEK_&ust=1579281937963825")
          ),
          Text(
            'Growing potatoes requires cool climate. Potatoes grow best in temprature of 15-20(°C). The potato grows best in well-drained soils and pH is optimal between 4.8 to 5.8.\nuses:The fleshy part of the root (potato) is commonly eaten as a vegetable. Potato is also used to make medicine. People take raw potato juice for stomach disorders and water retention (edema). A purified protein powder made from potato is mixed with water and used to control appetite for weight loss.pesticides:lambda cyhalothrin,Coragen,Endigo,Syngenta Crop Protection,Voliam Flexi',
            style :TextStyle(fontSize :20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}