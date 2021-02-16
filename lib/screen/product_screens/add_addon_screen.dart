import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/controller/productScreenControllers/addonController.dart';
import 'package:food/util/customWidgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddAddonScreen extends StatelessWidget {
  AddonController _addOnScreenController;


  var commonHeight;
  @override
  Widget build(BuildContext context) {
    commonHeight = 35.0;

    _addOnScreenController = Provider.of<AddonController>(context);

    return _body(context);
  }

  Widget _body(context) {
    return Container(
      width: Get.width,
      height: double.infinity,
      color: CustomColors.borderLightGreyLineBg,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  customSaveBtn(
                    onPressed: () {
                      print("Item Added");
                      _addOnScreenController.onAddItemClick();
                    },
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backBtn(
                    onPressed: () {
                      _addOnScreenController.onAddItemClick();
                    },
                  ),
                  SizedBox(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              _itemInfo(),
            ],
          ),
        ),
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
          Container(
            height: 40,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 32,
              ),
              child: Text(
                "Addon Item Information",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: xHeaderFont,
                ),
              ),
            ),
          ),
          _itemInfoBody(),
        ],
      ),
    );
  }

  Widget _itemInfoBody() {
    return Container(
      height: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 32,
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            _addonName(),
            SizedBox(
              height: 20,
            ),
            _addonLimit(),
            SizedBox(
              height: 20,
            ),
            _addonDesc(),
            SizedBox(
              height: 20,
            ),
            _addonPrice(),
          ],
        ),
      ),
    );
  }

  Widget _addonName() {
    return eachTextFieldItem(
        name: "Addon Item Name",
        hint: "Enter category name",
        onChange: (newVal) => _addOnScreenController.setItem(newVal));
  }

  Widget _addonLimit() {
    return eachTextFieldItem(
        name: "Item Limit",
        hint: "Set Item Limit",
        onChange: (newVal) => _addOnScreenController.setItem(newVal));
  }

  Widget _addonDesc() {
    return eachTextFieldItem(
        name: "Description",
        hint: "Enter Discription",
        onChange: (newVal) => _addOnScreenController.setItem(newVal));
  }

  Widget _addonPrice() {
    return eachTextFieldItem(
        name: "Price",
        hint: "Enter Price",
        onChange: (newVal) => _addOnScreenController.setItem(newVal));
  }
}
