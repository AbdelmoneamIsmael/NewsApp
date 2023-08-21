import 'package:get/get.dart';
import 'package:news_app/data/api/api_client.dart';
import 'package:news_app/data/controllers/controller.dart';
import 'package:news_app/data/repo/repo.dart';

import '../data/dio/dio_helper.dart';

Future<void> init()async{
// Get.lazyPut(() => ApiClient(url: 'https://newsapi.org'));
// Get.lazyPut(() => Repository(apiClient: Get.find()));
Get.lazyPut(() => Controller());
  DioHelper.init();
}