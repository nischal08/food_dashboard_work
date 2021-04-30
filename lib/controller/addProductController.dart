import 'dart:async';

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:image_picker/image_picker.dart';

class AddProductController extends ChangeNotifier {
  var image;
  String name ='';
  String actualPrice = '';
  String? offeredPrice;

  final picker = ImagePicker();
  setName(String val) {
    name = val;
    notifyListeners();
    print(name);
  }

  setActualPrice(String val) {
    actualPrice = val;
    notifyListeners();
    print(actualPrice);
  }

  setOfferedPrice(String val) {
    offeredPrice = val;
    notifyListeners();
    print(offeredPrice);
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (kIsWeb) {
        image = pickedFile.path;
      } else {
        image = File(pickedFile.path);
      }

      // image = File(pickedFile.path);
      notifyListeners();
    } else {
      print("Images");
    }
  }

  Map<String?, bool?> categoryList = {
    'Snack': false,
    'Dessert': false,
    'Mo:Mo': false,
    'Spicy': false,
    'Appetizer': false,
    'Chilly': false,
    'Sweet': false,
    'Salad': false,
    'breakfast': false,
    'dinner': false,
    'Salty': false,
    'add': false,
  };
  Map<String?, bool?> addonsList = {
    'Bread': false,
    'Mo:Mo': false,
    'Sauce': false,
    'Chilly': false,
    'Onion': false,
    'Chips': false,
    'Cake': false,
    'Breed': false,
    'Sugar': false,
    'Chocolate': false,
    'Potato': false,
    'add': false,
  };

  var _tmpCategoryArray = [];
  var _categoryStringList;

  getCategoryCheckItems() {
    categoryList.forEach((key, value) {
      if (value == true) {
        _tmpCategoryArray.add(key);
        notifyListeners();
      }
    });
    _categoryStringList = _tmpCategoryArray.join(", ");
    print(_categoryStringList);
    _tmpCategoryArray.clear();
    notifyListeners();
  }

  var _tmpAddonArray = [];
  var _addonStringList;

  getAddonCheckItems() {
    addonsList.forEach((key, value) {
      if (value == true) {
        _tmpAddonArray.add(key);
        notifyListeners();
      }
    });
    _addonStringList = _tmpAddonArray.join(", ");
    print(_addonStringList);
    _tmpAddonArray.clear();
    notifyListeners();
  }

  onChangeCategoryState({bool? newVal, String? currentKey}) {
    categoryList[currentKey] = newVal;
    notifyListeners();
  }

  onChangeAddOnsState({bool? newVal, String? currentKey}) {
    addonsList[currentKey] = newVal;
    notifyListeners();
  }

  String dropdownQualityValue = "---select---";
  // String get  => _dropdownQualityValue;

  // set dropdownQualityValue(String value) => _dropdownQualityValue = value;

  String dropdownTypeValue = "---select---";
  // String get dropdownTypeValue => _dropdownTypeValue;

  // set dropdownTypeValue(String value) => _dropdownTypeValue = value;

  setDropDownQuality(val) {
    dropdownQualityValue = val;
    notifyListeners();
    print(dropdownQualityValue);
  }

  setDropDownType(val) {
    dropdownTypeValue = val;
    notifyListeners();
    print(dropdownTypeValue);
  }

  // List list;

  // onSave() async {
  //   getCategoryCheckItems();
  //   getAddonCheckItems();
  //   list.add([
  //     "momoImg",
  //     true,
  //     name??"name",
  //     _categoryStringList??"category",
  //     _addonStringList??"addons",
  //     actualPrice??"no money",
  //     offeredPrice??"no money",
  //     "check",
  //     "Actions"
  //   ]);
  //   print(list);
  //   notifyListeners();
  // }
}
