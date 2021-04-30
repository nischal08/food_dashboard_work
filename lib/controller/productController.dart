import 'package:flutter/cupertino.dart';
import 'package:food/screen/addProductScreen.dart';
import 'package:food/screen/product_screen.dart';
import 'package:food/screen/product_screens/addon_screen.dart';
import 'package:food/screen/product_screens/category_screen.dart';
import 'package:food/screen/product_screens/quantity_screen.dart';
import 'package:food/screen/product_screens/type_screen.dart';

class ProductController extends ChangeNotifier {
  int currentProductIndex = 5;
  bool addItemFlag = false;

  List productScreens = [
    CategoryScreen(),
    AddonScreen(),
    QuantityScreen(),
    TypeScreen(),
    AddProductPage(),
    ProductScreen()
  ];

  onEachProductMenuClick(int index) {
    currentProductIndex = index;
    notifyListeners();
  }

  // int get currentProductIndex => _currentProductIndex;

  // set currentProductIndex(int value) => _currentProductIndex = value;

  // double _checkIndex = 2;
  bool tickState = false;
  List _urlList = [
    "assets/food/burger.png",
    "assets/food/cake.png",
    "assets/food/momo.png",
    "assets/food/fries.png",
  ];

  List get urlList => _urlList;
  List _infoHeadList = [
    "",
    "Type",
    "Name",
    "Category",
    "Addons",
    "Price",
    "Offer Price",
    "Not Available",
    "Actions"
  ];

  List _infoList = [
    [
      "burgerImg",
      true,
      "Chicken Burger",
      "Appetizer, Snack",
      "Lettuce, Cheese, Onions, Sauce",
      257,
      240,
      "check",
      "Actions"
    ],
    [
      "burgerImg",
      false,
      "Veg Burger",
      "Appetizer",
      "Lettuce, Cheese, Onions, Sauce",
      150,
      0,
      "check",
      "Actions"
    ],
    [
      "blackForestImg",
      true,
      "Black Forest",
      "Dessert",
      "Egg, Chocolate, Whipped cream, Cherries",
      190,
      100,
      "check",
      "Actions"
    ],
    [
      "momoImg",
      true,
      "Chicken MoMo",
      "Momo",
      "Chicken",
      130,
      100,
      "check",
      "Actions"
    ],
    [
      "momoImg",
      false,
      "Veg C.MoMo",
      "Momo",
      "Cabbage",
      255,
      0,
      "check",
      "Actions"
    ],
    [
      "frenchFriesImg",
      false,
      "French Fries",
      "Fries",
      "Potato",
      129,
      90,
      "check",
      "Actions"
    ],
  ];

  List get getProductScreens => productScreens;

  set setProductScreens(List productScreens) =>
      this.productScreens = productScreens;

  List get infoList => _infoList;

  List get infoHeadList => _infoHeadList;

  onTapOnCheckbox() {
    tickState = !tickState;
    notifyListeners();
  }

  onAddProductClick() {
    addItemFlag = !addItemFlag;
    notifyListeners();
  }

  deleteProduct(index) {
    _infoList.removeAt(index);
    notifyListeners();
  }
}
