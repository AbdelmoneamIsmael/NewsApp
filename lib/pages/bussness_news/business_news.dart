import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controllers/controller.dart';
import '../../main_page/news_item.dart';
import '../../reusable_component/colors/app_colors.dart';

class BusinessNews extends StatefulWidget {


  @override
  State<BusinessNews> createState() => _BusinessNews();
}

class _BusinessNews extends State<BusinessNews> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<Controller>(builder: (data) {
      data.getBusinessDataList();
      return data.businessLoaded? ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => NewsItem(data: data.businessList[index]),
          separatorBuilder: (context, index) => SizedBox(
            height: 5,
          ),
          itemCount: 5):Center(child: CircularProgressIndicator( color: AppColors.bottomColor),);
    });
  }
}
