import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'data/controllers/controller.dart';
import 'helper/dependancies.dart' as dep;
import 'main_page/main_page_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dep.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<Controller>().getDataList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:MainPageScreen(),
    );
  }
}
