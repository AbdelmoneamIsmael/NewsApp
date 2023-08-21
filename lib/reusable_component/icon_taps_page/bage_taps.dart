

import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../text/sub_header.dart';

class PageTapIcon extends StatelessWidget {
 String text;
 IconData icon;
 int currentPage;
 int index;
 PageTapIcon({required this.text,required this.icon,required this.currentPage,required this.index});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: AppColors.iconBackground,
                boxShadow: [
                  BoxShadow(
                    color:currentPage==index?AppColors.bottomColor: Colors.grey,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(50)
            ),
            child: Icon(
              icon,
              color:currentPage==index?AppColors.bottomColor: Colors.black,
            )),
        SizedBox(height: 10,),
        SubHeader(text: text,color: currentPage==index?AppColors.bottomColor:Colors.grey,),
      ],
    );
  }
}
