import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:nociapp/presentation/login/main.dart';

class Intro extends StatefulWidget {
  Intro({Key key}): super(key: key);

  @override
  _Intro createState() => _Intro();
}

class _Intro extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return IntroSlider(
        slides: List.generate(5, (int i) {
          return Slide(
              title: "ここにタイトル",
              description:
              "せつめいをいれろ\nせつめいをいれろ",
              styleDescription: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'Raleway'),
              backgroundColor: Color.fromRGBO(64, 75, 96, .9),
              marginDescription: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 20.0,
                  bottom: 70.0
              )
          );
        }),
        onDonePress: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
        }
    );
  }
}