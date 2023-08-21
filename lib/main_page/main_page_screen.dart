import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/data/controllers/controller.dart';
import 'package:news_app/data/dio/dio_helper.dart';
import 'package:news_app/pages/bussness_news/business_news.dart';
import 'package:news_app/pages/science/scince_news.dart';
import 'package:news_app/pages/search_news/search_page.dart';
import 'package:news_app/pages/sports/sport_news.dart';
import 'package:news_app/reusable_component/colors/app_colors.dart';
import 'package:news_app/reusable_component/icon_taps_page/bage_taps.dart';
import 'package:news_app/reusable_component/text/header_text.dart';

import '../pages/news/head_lline.dart';
import '../reusable_component/text/sub_header.dart';
import '../reusable_component/values/consts.dart';
import 'news_item.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  String searchWord='abdo';
  bool onSearch=false;
  TextEditingController searchBar=TextEditingController();
  List pagesText = ['News', 'Sports', 'Science', 'Business'];
  List pagesIcon = [
    Icons.mic_none_outlined,
    Icons.sports_soccer_outlined,
    Icons.science_outlined,
    Icons.business,
  ];
  List pages = [
    HeadLineNews(),
    SportsNews(),
    ScienceNews(),
    BusinessNews(),
  ];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeaderText(
                    text: 'News App',
                    size: 30,
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.sort_outlined,
                        color: Colors.white,
                      ))
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      SubHeader(
                        text: 'Hey! Abdelmoneam',
                        size: 23,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      HeaderText(
                        text: 'Discover Latest News',
                        size: 40,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'search for news',
                              ),
                             controller: searchBar,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                            setState(() {
                              print('you clicked');
                              onSearch=true;
                              searchWord=searchBar.text.toString();
                              currentPage=5;
                            });
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: AppColors.bottomColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.search_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 120,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: (){
                              setState(() {
                                onSearch=false;
                                currentPage=index;
                              });
                            },
                            child: PageTapIcon(
                                text: pagesText[index], icon: pagesIcon[index],currentPage: currentPage,index: index,),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 15,
                          ),
                          itemCount: pagesIcon.length,
                        ),
                      ),
                      // SizedBox(height: 40,),
                     onSearch?SearchNews(searchKey: searchWord,): pages[currentPage],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
