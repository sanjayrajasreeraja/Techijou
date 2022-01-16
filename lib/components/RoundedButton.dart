import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.colour,
      required this.left,
      required this.top,
      required this.right,
      required this.bottom,
      required this.text,
      required this.textsize,
      required this.onpress,
      this.colourbg = Colors.transparent});

  final double left;
  final double top;
  final double right;
  final double bottom;
  final Color colour;
  final String text;
  final double textsize;
  final Function onpress;
  final Color colourbg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: colourbg,
              primary: colour,
              textStyle: TextStyle(fontSize: textsize),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                  side: BorderSide(
                    color: Colors.black,
                    width: 3,
                  )),
              padding: EdgeInsets.fromLTRB(left, top, right, bottom)),
          onPressed: () => onpress(),
          child: Text(text),
        ),
      ),
    );
  }
}
