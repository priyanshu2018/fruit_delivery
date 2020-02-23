import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class AnimatedText extends StatefulWidget {

  final text;
  final double fontSize;
  AnimatedText({this.text,this.fontSize});

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  @override
  Widget build(BuildContext context) {
    return TyperAnimatedTextKit(

      onTap: (){

      },
      isRepeatingAnimation: false,
      speed: Duration(milliseconds: 200),
      text: [widget.text

      ],
      textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: widget.fontSize,
      ),
    );
  }
}
