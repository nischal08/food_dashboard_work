import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/controller/productScreenControllers/quantityScreenController.dart';
import 'package:food/util/customWidgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddQuantityScreen extends StatelessWidget {
  QuantityController _quantityControllerState;

  var commonHeight;
  @override
  Widget build(BuildContext context) {
    commonHeight = 35.0;

    _quantityControllerState = Provider.of<QuantityController>(context);

    return _body(context);
  }

  Widget _body(context) {
    return Container(
      height: double.infinity,
        width: Get.width,
       
        color: CustomColors.borderLightGreyLineBg,
        child: SingleChildScrollView(
          child: Container(
             padding: EdgeInsets.symmetric(
    horizontal: 32,
    vertical: 20,
        ),
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              saveItemBtn(
                onPressed: () {
                  print("Item Added");
                  _quantityControllerState.onAddQuantityClick();
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
                  _quantityControllerState.onAddQuantityClick();
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
      width: 370,
      decoration: BoxDecoration(
        border: kBorderTextFieldAndAddCard,
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
              child: Text(
                "Quantity Information",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: xHeaderFont),
              ),
            ),
          ),
          _itemInfoBody()
        ],
      ),
    );
  }

  Widget _itemInfoBody() {
    return Container(
      height: 111,
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
            _itemName(),
          ],
        ),
      ),
    );
  }

  Widget _itemName() {
    return eachTextFieldItem(
      name: "Total Quantity",
      hint: "Enter quantity",
      onChange: (newVal) => _quantityControllerState.setName(newVal),
    );
  }
}
