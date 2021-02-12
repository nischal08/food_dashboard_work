import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/controller/addProductController.dart';
import 'package:food/controller/productController.dart';
import 'package:food/responsive.dart';
import 'package:food/screen/addProductScreen.dart';
import 'package:food/util/customWidgets.dart';
import 'package:food/util/searchBarItems.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductScreen extends StatelessWidget {
  ProductController _productControllerState;
  AddProductController _addProductControllerState;

  double commonHeight;

  
  @override
  Widget build(BuildContext context) {
    _productControllerState = Provider.of<ProductController>(context);
    _addProductControllerState = Provider.of<AddProductController>(context);

    return _body();
  }

  Widget _body() {
    return _productControllerState.addItemFlag
        ? Expanded(child: AddProductPage())
        : Expanded(
            child: Container(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Responsive.isMobile(Get.context) ? 15 : 34,
                      vertical: Responsive.isMobile(Get.context) ? 12 : 25),
                  child: Column(
                    children: [
                      _searchBarItems(),
                      SizedBox(
                        height: Responsive.isMobile(Get.context) ? 12 : 25,
                      ),
                      _foodDataTable(),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget _foodDataTable() {
    return Container(
      //elevation: 1,

      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [kGeneralBoxShadow]),

      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 19),
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(Responsive.isDesktop(Get.context) ? 70 : 95),
            1: FlexColumnWidth(76),
            2: FlexColumnWidth(Responsive.isDesktop(Get.context) ? 140 : 165),
            3: FlexColumnWidth(Responsive.isDesktop(Get.context) ? 130 : 116),
            4: FlexColumnWidth(Responsive.isDesktop(Get.context) ? 151 : 110),
            5: FlexColumnWidth(100),
            6: FlexColumnWidth(Responsive.isDesktop(Get.context) ? 114 : 100),
            7: FlexColumnWidth(Responsive.isDesktop(Get.context) ? 132 : 120),
            8: FlexColumnWidth(Responsive.isDesktop(Get.context) ? 48 : 83),
          },
          border: TableBorder(
            horizontalInside:
                BorderSide(width: 1, color: CustomColors.borderLightGreyLineBg),
           
          ),
          children: [
            TableRow(children: [
              for (var head in _productControllerState.infoHeadList)
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.only(
                    top: 7.0,
                    bottom: 13.0,
                  ),
                  child: Text(
                    head.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: xHeaderFont),
                  ),
                ))
            ]),
            for (List eachList in _productControllerState.infoList)
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: _foodImage(
                        url: _productControllerState.urlList[
                            eachList[0] == "burgerImg"
                                ? 0
                                : eachList[0] == "blackForestImg"
                                    ? 1
                                    : eachList[0] == "momoImg"
                                        ? 2
                                        : 3])),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        _foodType(eachList[1]),
                      ],
                    )),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: _productName(
                    text: eachList[2],
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: SizedBox(
                    width: 82,
                    child: _productName(text: eachList[3]),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: SizedBox(
                    width: 124.0,
                    child: _productName(
                      text: eachList[4],
                    ),
                  ),
                ),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: _productName(
                        text: eachList[5] == 0
                            ? "--"
                            : "Rs. ${eachList[5].toString()}")),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: _productName(
                        text: eachList[6] == 0
                            ? "--"
                            : "Rs. ${eachList[6].toString()}")),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Row(
                    children: [
                      SizedBox(
                        width: Responsive.isDesktop(Get.context) ? 35 : 20,
                      ),
                      _productNotAvail()
                    ],
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: actionButtons(onPressDelete: () {
                    _productControllerState.deleteProduct(
                        _productControllerState.infoList.indexOf(eachList));
                  }),
                )
              ]),
          ],
        ),
      ),
    );
  }

  Widget _productNotAvail() {
    return CustomCheckbox(
      bgColor: CustomColors.green,
      checkValue: _productControllerState.tickState,
      onCheckboxClick: () {
        _productControllerState.onTapOnCheckbox();
      },
    );
  }

  Widget _productName({String text}) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.0,
        bottom: 15.0,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            fontSize: xBodyFont,
          ),
        ),
      ),
    );
  }

  Widget _foodImage(
      {String url, BoxShape shape, double height, double bottomPadding}) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: bottomPadding ?? 16, right: 15),
      height: height ?? 30,
      width: 30,
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(
            url,
          ),
        ),
      ),
    );
  }

  Widget _foodType(bool val) {
    return val
        ? _eachFoodType("assets/veg&nonVeg/nonVeg.png")
        : _eachFoodType("assets/veg&nonVeg/Veg.png");
  }

  Widget _eachFoodType(String assets) {
    return Container(
      // padding: EdgeInsets.only(top:16),
      color: Colors.white,
      child: Image.asset(
        assets,
        fit: BoxFit.contain,
        width: 12,
        height: 12,
      ),
    );
  }

  Widget _searchBarItems() {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: 400.0,
              child: SearchBar(),
            ),
          ),
          SizedBox(
            width: Responsive.isMobile(Get.context) ||
                    Responsive.isTablet(Get.context)
                ? 15
                : 30,
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                children: [
                  EntriesShowBtn(
                    entries: _productControllerState.infoList.length,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  AddEntriesBtn(),
                ],
              ),
            ),
          ),
          Container(
            child: addnewBtn(
              onPress: () {
                _productControllerState.onAddProductClick();
              },
            ),
          ),
        ],
      ),
    );
  }
}


