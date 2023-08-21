import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controllers/controller.dart';
import '../../main_page/news_item.dart';
import '../../reusable_component/colors/app_colors.dart';


class SearchNews extends StatefulWidget {
  String searchKey;
  SearchNews({ this.searchKey='me'});

  @override
  State<SearchNews> createState() => _SearchNews();
}

class _SearchNews extends State<SearchNews> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(builder: (data) {
      data.getSearchListDataList(searchKey: widget.searchKey);
      return data.searchLoaded? ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => NewsItem(data: data.searchList[index]),
          separatorBuilder: (context, index) => SizedBox(
            height: 5,
          ),
          itemCount: data.searchList.length):Center(child: CircularProgressIndicator( color: AppColors.bottomColor),);
    });
  }
}
