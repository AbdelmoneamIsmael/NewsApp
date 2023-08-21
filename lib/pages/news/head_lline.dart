import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controllers/controller.dart';
import '../../main_page/news_item.dart';
import '../../reusable_component/colors/app_colors.dart';

class HeadLineNews extends StatefulWidget {
   HeadLineNews({super.key});

  @override
  State<HeadLineNews> createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(builder: (data) {
      return data.headLineLoaded? ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => NewsItem(data: data.newsList[index]),
          separatorBuilder: (context, index) => SizedBox(
            height: 5,
          ),
          itemCount: 5):Center(child: CircularProgressIndicator( color: AppColors.bottomColor),);
    });
  }
}
