import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controllers/controller.dart';
import '../../main_page/news_item.dart';
import '../../reusable_component/colors/app_colors.dart';

class ScienceNews extends StatefulWidget {

  @override
  State<ScienceNews> createState() => _ScienceNews();
}

class _ScienceNews extends State<ScienceNews> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(builder: (data) {
      data.getScienceDataList();
      return data.scienceLoaded? ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => NewsItem(data: data.scienceList[index]),
          separatorBuilder: (context, index) => SizedBox(
            height: 5,
          ),
          itemCount: 5):Center(child: CircularProgressIndicator( color: AppColors.bottomColor),);
    });
  }
}
