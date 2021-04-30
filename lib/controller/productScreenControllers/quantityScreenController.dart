import 'package:flutter/material.dart';
import 'package:food/classes/quantity.dart';
// import 'package:jsend/api_request.dart';

class QuantityController extends ChangeNotifier {
  List quantityInfoList = [];

  bool addQualtityFlag = false;

  Quantity? toEdit;

  List infoHeadList = [
    "Quantity Name",
    "Actions",
  ];
  List get getInfoHeadList => infoHeadList;

  set setInfoHeadList(List infoHeadList) => this.infoHeadList = infoHeadList;
  List get getQuantityInfoList => quantityInfoList;

  set setQuantityInfoList(List quantityInfoList) {
    if (this.quantityInfoList.length == quantityInfoList.length) {
      print("cancelling update since same length.");
      return;
    }
    this.quantityInfoList = quantityInfoList;
    print("from set list");

    notifyListeners();
  }

  deleteProduct(Quantity q) async {
    await Quantity.remove(q);
    print("from delete");

    notifyListeners();
  }

  editProduct(Quantity q) {
    addQualtityFlag = !addQualtityFlag;
    toEdit = q;
    notifyListeners();
  }

  onAddQuantityClick([bool added = false]) async {
    addQualtityFlag = !addQualtityFlag;

    print("from add");
    if (added) {
      await Quantity.allFromServer(true);
    }
    notifyListeners();
  }

  String? quantityName;
  setName(String val) {
    quantityName = val;
    notifyListeners();
    print(quantityName);
  }
}
