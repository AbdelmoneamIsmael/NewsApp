import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controllers/controller.dart';
import '../../main_page/news_item.dart';
import '../../reusable_component/colors/app_colors.dart';


class SportsNews extends StatefulWidget {
   SportsNews({super.key});

  @override
  State<SportsNews> createState() => _SportsNews();
}

class _SportsNews extends State<SportsNews> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(builder: (data) {
      data.getSportsDataList();
      return data.sportsLoaded? ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => NewsItem(data: data.sportsList[index]),
          separatorBuilder: (context, index) => SizedBox(
            height: 5,
          ),
          itemCount: 5):Center(child: CircularProgressIndicator( color: AppColors.bottomColor),);
    });
  }
}
