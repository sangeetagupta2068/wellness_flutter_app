import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wellness_flutter_app/SeasonTheme.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var seasonThemeList = [
    SeasonTheme('images/autumn.jpg',
        'Every leaf speaks bliss to me,\nfluttering from the autumn tree.'),
    SeasonTheme('images/monsoon.jpg',
        'Anyone who says sunshine brings happiness has never danced in the rain'),
    SeasonTheme('images/summer.jpg',
        'The summer night is like a perfection of thought.')
  ];
  var count = 0;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(seasonThemeList[count].assetURL),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      seasonThemeList[count].quote,
                      style: TextStyle(
                          fontFamily: 'Bilbo Swash Caps',
                          color: Colors.white54,
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Random random = new Random();
                      setState(() {
                        count = random.nextInt(2);
                      });
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textColor: Colors.white,
                    color: Colors.black,
                    padding: EdgeInsets.all(10.0),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
