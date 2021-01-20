import 'package:flutter/material.dart';
import 'package:food/controller/addProductController.dart';
import 'package:food/controller/commonController.dart';
import 'package:food/controller/creditController.dart';

import 'package:food/screen/home.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'controller/homeController.dart';
import 'controller/productController.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>HomeController(),),
    ChangeNotifierProvider(create: (_)=>CommomController(),),
    ChangeNotifierProvider(create: (_)=>ProductController(),),
     ChangeNotifierProvider(create: (_)=>CreditController(),),
     ChangeNotifierProvider(create: (_)=>AddProductController(),),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  bool changeColor = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Food app',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
  }
}
