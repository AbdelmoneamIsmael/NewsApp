import 'package:get/get.dart';

import '../../reusable_component/values/consts.dart';

class ApiClient extends GetConnect implements GetxService{
   String token=tokenData;
  final String url;
  late Map<String,String> mainHeader;
  ApiClient({required this.url,}){
    baseUrl=url;
    timeout=Duration(seconds: 30);
    mainHeader={

      'country':'eg',
      'apiKey':'$token',

    };
  }

  Future<Response> getData(String uri)  async {
    print(mainHeader);
    try{
       Response response= await get(uri);
       return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }
}