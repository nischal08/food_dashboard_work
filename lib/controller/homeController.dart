import 'package:flutter/cupertino.dart';
import 'package:food/screen/allProductScreen.dart';
import 'package:food/screen/credit_screen.dart';
import 'package:food/screen/customer_screen.dart';
import 'package:food/screen/dashboard_screen.dart';
import 'package:food/screen/order_screen.dart';
import 'package:food/screen/setting_screen.dart';

class HomeController extends ChangeNotifier {
  int currentMenuItemIndex = 2;

  late int currentProductIndex = 0;

  // int get currentProductIndex => _currentProductIndex;

  // set currentProductIndex(int value) => _currentProductIndex = value;

  // int get currentMenuItemIndex => _currentIndex;

  bool productToggleFlag = false;
  // bool get productToggleFlag => _productToggleFlag;

  // set productToggleFlag(bool value) => _productToggleFlag = value;

  List productList = [
    "Categories",
    "Addons Items",
    "Quantity",
    "Type",
  ];
  List get getProductList => productList;

  set setProductList(List productList) => this.productList = productList;

  int getOpacityForOrientation(context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return 0;
    } else {
      return 1;
    }
  }

  List _screens = [
    DashboardScreen(),
    OrderScreen(),
    AllProductScreen(),
    CustomerScreen(),
    CreditDashboard(),
    SettingScreen(),
  ];

  List get screensList => _screens;

  // set currentMenuItemIndex(int value) {
  //   _currentIndex = value;
  // }

  void onProductToggle() {
    productToggleFlag = !productToggleFlag;
    notifyListeners();
  }

  void onSelect(int index) {
    currentMenuItemIndex = index;
    notifyListeners();
  }

  void onSelectProductMenu(int index) {
    currentProductIndex = index;
    notifyListeners();
  }
}
