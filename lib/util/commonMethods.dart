
 import 'package:flutter/material.dart';

bool getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    print(data.size.shortestSide < 600 ? 'phone' : 'tablet');
    return data.size.shortestSide < 600 ? true : false;
  }