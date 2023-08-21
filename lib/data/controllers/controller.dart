import 'package:get/get.dart';
import 'package:news_app/data/model/NewsDataModel.dart';

import '../../reusable_component/values/consts.dart';
import '../dio/dio_helper.dart';
import '../repo/repo.dart';

class Controller extends GetxController{


//headline
List<Articles> newsList=[];
late NewsDataModel headLineData;
bool headLineLoaded=false;
Future<void> getDataList()async{

  DioHelper.getData(url: endPointUrl, query: {

    // 'country':'eg',
    'apiKey':'$tokenData',
    'q':'tesla',
    'sortBy':'publishedAt',


  },).then((value) {
    newsList=[];
    headLineData=NewsDataModel.fromJson(value.data);
    newsList=headLineData.articles!;
    headLineLoaded=true;
    update();
  });
}
//sports
List<Articles> sportsList=[];
late NewsDataModel sportsData;
bool sportsLoaded=false;
Future<void> getSportsDataList()async{

  DioHelper.getData(url: endPointCategory, query: {

    // 'country':'eg',
    'apiKey':'0b858564b4b740d4ac7bc0fd110918e2',
    'country':'us',
    'category':'sports',

  },).then((value) {
    sportsList=[];
    sportsData=NewsDataModel.fromJson(value.data);
    sportsList=sportsData.articles!;
    sportsLoaded=true;
    update();
  });
}
//science
  List<Articles> scienceList=[];
  late NewsDataModel scienceData;
  bool scienceLoaded=false;
  Future<void> getScienceDataList()async{

    DioHelper.  getData(url: '/v2/top-headlines', query: {

      // 'country':'eg',
      'apiKey':'$tokenData',
      'country':'us',
      'category':'science',

    },).then((value) {
      scienceList=[];
      scienceData=NewsDataModel.fromJson(value.data);
      scienceList=scienceData.articles!;
      scienceLoaded=true;
      update();
    });
  }
//business

  List<Articles> businessList=[];
  late NewsDataModel businessData;
  bool businessLoaded=false;
  Future<void> getBusinessDataList()async{

    DioHelper.getData(url: endPointCategory, query: {

      // 'country':'eg',
      'apiKey':'$tokenData',
      'country':'us',
      'category':'business',

    },).then((value) {
      businessList=[];
      businessData=NewsDataModel.fromJson(value.data);
      businessList=businessData.articles!;
      businessLoaded=true;
      update();
    });
  }
//search

  List<Articles> searchList=[];
  late NewsDataModel searchData;
  bool searchLoaded=false;
  Future<void> getSearchListDataList({required String searchKey})async{

    DioHelper.getData(url: endPointCategory, query: {

      // 'country':'eg',
      'apiKey':'$tokenData',
      'q':'${searchKey}',
      'from':'2023-07-21','sortBy':'publishedAt'

    },).then((value) {
      searchList=[];
      searchData=NewsDataModel.fromJson(value.data);
      searchList=searchData.articles!;
      searchLoaded=true;
      update();
    });

}
}