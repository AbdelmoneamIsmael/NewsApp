import 'package:get/get.dart';
import 'package:news_app/data/api/api_client.dart';
import 'package:news_app/reusable_component/values/consts.dart';

class Repository extends GetxService{
  final ApiClient apiClient;
  Repository({required this.apiClient});

  Future<Response> getDataConnect ()async{
    return apiClient.getData(endPointUrl);
  }
}