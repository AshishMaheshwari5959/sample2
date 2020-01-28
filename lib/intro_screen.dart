import 'package:sample2/utils/cropify.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:sample2/utils/my_navigator.dart';
import 'package:sample2/widgets/walkthrough.dart';


class IntroScreen extends StatefulWidget {
  @override
  
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 3) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEEEEE),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: PageView(
              children: <Widget>[
                Walkthrough(
                  title: Cropify.wt1,
                  content: Cropify.wc1,
                  imageIcon: Icons.center_focus_weak,
                ),
                Walkthrough(
                  title: Cropify.wt2,
                  content: Cropify.wc2,
                  imageIcon: Icons.search,
                ),
                Walkthrough(
                  title: Cropify.wt3,
                  content: Cropify.wc3,
                  imageIcon: Icons.add_a_photo,
                ),
                Walkthrough(
                  title: Cropify.wt4,
                  content: Cropify.wc4,
                  imageIcon: Icons.verified_user,
                ),
              ],
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text(lastPage ? "" : Cropify.skip,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () =>
                      lastPage ? null : MyNavigator.goToRoot(context),
                ),
                FlatButton(
                  child: Text(lastPage ? Cropify.gotIt : Cropify.next,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? MyNavigator.goToRoot(context)
                      : controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}