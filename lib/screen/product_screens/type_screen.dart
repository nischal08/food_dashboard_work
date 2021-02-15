import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/controller/productScreenControllers/typeController.dart';
import 'package:food/screen/product_screens/add_type_screen.dart';
import 'package:food/util/commonMethods.dart';
import 'package:food/util/customWidgets.dart';
import 'package:food/util/searchBarItems.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TypeScreen extends StatelessWidget {
  TypeController _typeControllerState;
  // AddProductController _addProductControllerState;

  double commonHeight;

  BoxShadow boxShad = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 4,
      offset: Offset(2, 2));

  @override
  Widget build(BuildContext context) {
    _typeControllerState = Provider.of<TypeController>(context);
    // _addProductControllerState = Provider.of<AddProductController>(context);
    commonHeight = 35;

    return _body();
  }

  Widget _body() {
    return _typeControllerState.addTypeFlag
        ? Expanded(
            child: AddTypeScreen(),
          )
        : Expanded(
            child: Container(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Container(
                  color: Color(0xffF4F4F4),
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _searchBarItems(),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: _typeDataTable(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget _typeDataTable() {
    return Container(
      //elevation: 1,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
         kGeneralBoxShadow,
        ],
      ),

      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 8.0,
            left: 20,
            right: 20,
          ),
          child: Table(
            columnWidths: {
              0: FlexColumnWidth(107),
              1: FlexColumnWidth(127),
              2: FlexColumnWidth(55.0 + 34.0),
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
                  for (var head in _typeControllerState.infoHeadList)
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.only(
                         top: 8,
                        bottom: 13,
                      ),
                      child: Text(
                        head.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: xHeaderFont),
                      ),
                    ))
                ],
              ),
              for (List eachList in _typeControllerState.infoList)
                TableRow(children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: _typeName(text: eachList[0]),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        _eachFoodType(eachList[1]),
                      ],
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: actionButtons(onPressDelete: () {
                      _typeControllerState.deleteEntries(
                        _typeControllerState.infoList.indexOf(eachList),
                      );
                    }),
                  )
                ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _eachFoodType(String assets) {
    return Container(
      color: Colors.white,
      child: Image.asset(
        assets,
        fit: BoxFit.contain,
        width: 12,
        height: 12,
      ),
    );
  }

  Widget _typeName({String text}) {
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

  Widget _searchBarItems() {
    return Container(
      child: Row(
        children: [
          Expanded(flex: 4, child: SearchBar()),
          SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                EntriesShowBtn(
                  entries: _typeControllerState.infoList.length,
                ),
                SizedBox(
                  width: 5,
                ),
                AddEntriesBtn(),
              ],
            ),
          ),
          addnewBtn(
            onPress: () {
              _typeControllerState.onAddTypeClick();
            },
          ),
        ],
      ),
    );
  }
}
