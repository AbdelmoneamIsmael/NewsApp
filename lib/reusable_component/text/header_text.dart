import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  String text;
  double size ;

  HeaderText({required this.text, this.size= 20});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }
}
