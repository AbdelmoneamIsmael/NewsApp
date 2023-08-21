import 'package:flutter/material.dart';

class SubHeader extends StatelessWidget {
  String text;
  double size ;
  Color color;

  SubHeader({required this.text, this.size= 20, this.color=const  Color(0xFF424243)});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color,
        fontWeight: FontWeight.normal,
        fontSize: size,
      ),
    );
  }
}
