import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/controller/productScreenControllers/addonController.dart';
import 'package:food/responsive.dart';
import 'package:food/util/customWidgets.dart';
import 'package:food/util/searchBarItems.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'add_addon_screen.dart';

//ignore: must_be_immutable
class AddonScreen extends StatelessWidget {
  AddonController _addOnScreenController;
  double commonHeight;

  BoxShadow boxShad = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 4,
      offset: Offset(2, 2));

  @override
  Widget build(BuildContext context) {
    _addOnScreenController = Provider.of<AddonController>(context);
    commonHeight = 35;
    return _body();
  }

  Widget _body() {
    return Expanded(
        child: _addOnScreenController.addOnScreenFlag
            ? AddAddonScreen()
            : Container(
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
                        _itemDatatable(),
                      ],
                    ),
                  ),
                ),
              ));
  }

  Widget _itemDatatable() {
    return Container(
      width: 800,
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
            0: FlexColumnWidth(122),
            1: FlexColumnWidth(106),
            2: FlexColumnWidth(162),
            3: FlexColumnWidth(137),
            4: FlexColumnWidth(154),
            5: FlexColumnWidth(65),
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
                for (var head in _addOnScreenController.itemHeadList)
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
                          fontWeight: FontWeight.bold, fontSize: xHeaderFont),
                    ),
                  ))
              ],
            ),
            for (var item in _addOnScreenController.itemInfoList)
              TableRow(
                children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: _infoName(
                          text: item[0],
                        ),
                      )),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: _infoName(text: item[1])),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: _infoName(text: item[2])),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: _infoName(text: item[3])),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 35,
                        ),
                        _productNotAvail()
                      ],
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: actionButtons(onPressDelete: () {
                      _addOnScreenController.deleteItem(
                          _addOnScreenController.itemInfoList.indexOf(item));
                    }),
                  )
                ],
              ),
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
                    entries: _addOnScreenController.itemInfoList.length,
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
               _addOnScreenController.onAddItemClick();
              },
            ),
          ),
        ],
      ),
    );
  }

  

  Widget _infoName({String text}) {
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

  Widget _productNotAvail() {
    return CustomCheckbox(
      bgColor: CustomColors.green,
      checkValue: _addOnScreenController.tickState,
      onCheckboxClick: () {
        _addOnScreenController.onTapOnCheckbox();
      },
    );
  }
}
