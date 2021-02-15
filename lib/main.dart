import 'package:flutter/material.dart';
import 'package:food/controller/addProductController.dart';
import 'package:food/controller/creditController.dart';
import 'package:food/controller/productScreenControllers/addonController.dart';

import 'package:food/controller/productScreenControllers/quantityScreenController.dart';
import 'package:food/controller/productScreenControllers/typeController.dart';
import 'package:food/screen/home.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controller/homeController.dart';
import 'controller/productController.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductController(),
        ),
        ChangeNotifierProvider(
          create: (_) => CreditController(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddProductController(),
        ),
        ChangeNotifierProvider(
          create: (_) => QuantityController(),
        ),
        ChangeNotifierProvider(
          create: (_) => TypeController(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddonController(),
        ),
        
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  bool changeColor = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData( 
        
        scaffoldBackgroundColor: Color(0xffF4F4F4),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: 'Food app',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
