import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/controller/productScreenControllers/categoryScreenController.dart';
import 'package:food/responsive.dart';
import 'package:food/screen/product_screens/add_category_screen.dart';
import 'package:food/util/customWidgets.dart';
import 'package:food/util/searchBarItems.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatelessWidget {
  CategoryController _categoryControllerState;
  // AddProductController _addProductControllerState;

  double commonHeight;

  @override
  Widget build(BuildContext context) {
    _categoryControllerState = Provider.of<CategoryController>(context);

    commonHeight = 35;

    return _body();
  }

  Widget _body() {
    return _categoryControllerState.addCategoryFlag
        ? Expanded(child: AddCategoryScreen())
        : Expanded(
                  child: Container(
              height: double.infinity,
             
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _searchBarItems(),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: _categoryDataTable(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        );
  }

  Widget _categoryDataTable() {
    return Container(
      width: 727,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          kGeneralBoxShadow,
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 19),
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(182),
            1: FlexColumnWidth(159),
            2: FlexColumnWidth(147),
            3: FlexColumnWidth(146),
            4: FlexColumnWidth(60),
          },
          border: TableBorder(
            horizontalInside: BorderSide(
              width: 1,
              color: CustomColors.borderLightGreyLineBg,
            ),
          ),
          children: [
            TableRow(
              children: [
                for (var head in _categoryControllerState.infoHeadList)
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.only(
                      left: head == "Name" ? 10 : 0,
                      top: 7.0,
                      bottom: 13.0,
                    ),
                    child: Text(
                      head.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: xHeaderFont,
                      ),
                    ),
                  ))
              ],
            ),
            for (var item in _categoryControllerState.categoryInfoList)
              TableRow(children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: _categoryName(text: item[0]),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: _categoryBox(),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/food/burger.png'),
                    height: 21,
                    width: 30,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: _categoryName(text: item[1]),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: actionButtons(onPressDelete: () {
                    _categoryControllerState.deleteProduct(
                        _categoryControllerState.categoryInfoList
                            .indexOf(item));
                  }),
                ),
              ]),
          ],
        ),
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
                    entries: _categoryControllerState.categoryInfoList.length,
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
                _categoryControllerState.onAddCategoryClick();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryName({String text}) {
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

  Widget _categoryBox() {
    return Container(
      height: 18,
      width: 21,
      color: Colors.blue,
    );
  }
}
