import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/Responsive.dart';
import 'package:food/constants/constants.dart';

import 'package:food/constants/customColors.dart';
import 'package:food/controller/productScreenControllers/addonController.dart';

import 'package:food/util/commonMethods.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddAddonScreen extends StatelessWidget {
  AddonController _addOnScreenController;

  OutlineInputBorder borderData;

  var commonHeight;
  @override
  Widget build(BuildContext context) {
    commonHeight = 35;

    _addOnScreenController = Provider.of<AddonController>(context);
    borderData = kBorderInputData;
    return _body(context);
  }

  Widget _body(context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 40 : 30, vertical: 20),
      color: CustomColors.borderLightGreyLineBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              _saveItemBtn(context),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _backBtn(context),
              SizedBox(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          _itemInfo(),
        ],
      ),
    );
  }

  Widget _backBtn(context) {
    return GestureDetector(
      onTap: () {
        _addOnScreenController.onAddItemClick();
      },
      child: Container(
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_rounded,
              size: 18,
              color: Colors.black87,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "Back",
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _saveItemBtn(context) {
    return Container(
      height: commonHeight,
      child: RaisedButton(
        onPressed: () {
          print("Item Added");
          _addOnScreenController.onAddItemClick();
        },
        elevation: 1,
        child: Text(
          "Save Item",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontFamily: "Roboto"),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: CustomColors.green,
      ),
    );
  }

  Widget _itemInfo() {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
            child: Text(
              "AddOn Item Information",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          _itemInfoBody(),
        ],
      ),
    );
  }

  Widget _itemInfoBody() {
    return Container(
      height: Responsive.isMobile(Get.context) ? 320 : 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 30,
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            _itemName1(),
            SizedBox(
              height: 20,
            ),
            _itemName2(),
            SizedBox(
              height: 20,
            ),
            _itemName3(),
            SizedBox(
              height: 20,
            ),
            _itemName4(),
          ],
        ),
      ),
    );
  }

  Widget _itemName1() {
    return _eachItem(
        name: "Addon Item Name",
        hint: "Enter category name",
        onChange: (newVal) => _addOnScreenController.setItem(newVal));
  }

  Widget _itemName2() {
    return _eachItem(
        name: "Item Limit",
        hint: "Set Item Limit",
        onChange: (newVal) => _addOnScreenController.setItem(newVal));
  }

  Widget _itemName3() {
    return _eachItem(
        name: "Description",
        hint: "Enter Discription",
        onChange: (newVal) => _addOnScreenController.setItem(newVal));
  }

  Widget _itemName4() {
    return _eachItem(
        name: "Price",
        hint: "Enter Price",
        onChange: (newVal) => _addOnScreenController.setItem(newVal));
  }

  Widget _eachItem({String name, String hint, Function onChange(newVal)}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: getDeviceType()
              ? 30
              : Get.context.isPortrait
                  ? (Get.height * .0345)
                  : (Get.height * .05),
          child: TextFormField(
            onChanged: (String newVal) {
              onChange(newVal);
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                focusedBorder: borderData,
                enabledBorder: borderData,
                contentPadding: EdgeInsets.only(left: 10.0),
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
                filled: true,
                fillColor: Colors.white),
            enabled: true,
          ),
        )
      ],
    );
  }
}
