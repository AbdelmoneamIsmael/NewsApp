import 'package:dio/dio.dart';
import 'package:news_app/reusable_component/values/consts.dart';

class DioHelper{
  static late Dio dio;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,

      )
    );
  }

  static Future<Response> getData  ({required String url,required Map<String,dynamic> query })async{
     return dio.get(url,queryParameters: query);
  }
}