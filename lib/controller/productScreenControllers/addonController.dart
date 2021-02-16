import 'package:flutter/material.dart';

class AddonController extends ChangeNotifier {
  List itemHeadList = [
    "Name",
    "Limit",
    "Description",
    "Price",
    "Not Available",
    "Actions",
  ];
  List itemInfoList = [
    ["Cheese", "100", "per slice", "Rs.50", "check", "action"],
    ["MoMo", "120", "8 pieces", "Rs.150", "check", "action"],
    ["Mushroom", "400", "-", "Rs.190.86", "check", "action"],
    ["Chutni", "100", "-", "Rs.130", "check", "action"],
    ["Onion", "390", "-", "Rs.255", "check", "action"]
  ];
  bool addOnScreenFlag = false;
  bool tickState = false;

  List get getItemHeadList => itemHeadList;
  set setItemHeadList(List itemHeadList) => this.itemHeadList = itemHeadList;

  List get getItemInfoList => itemInfoList;
  set setItemInfoLit(List itemInfoList) => this.itemInfoList = itemInfoList;

  deleteItem(int index) {
    itemInfoList.removeAt(index);
    notifyListeners();
  }

  onAddItemClick({bool flag}) {
    addOnScreenFlag = flag ?? (!addOnScreenFlag);
    notifyListeners();
  }

  onTapOnCheckbox() {
    tickState = !tickState;
    notifyListeners();
  }

  String _itemHead;

  String get itemHead => _itemHead;

  set itemHead(String value) {
    _itemHead = value;
    setHead(String val) {
      itemHead = val;
      notifyListeners();
      print(itemHead);
    }
  }

  String _itemInfo;
  String get itemInfo => _itemInfo;

  set itemInfo(String value) => _itemInfo = value;
  setItem(String val) {
    itemInfo = val;
    notifyListeners();
    print(itemInfo);
  }
}
