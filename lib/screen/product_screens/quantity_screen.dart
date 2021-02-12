import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/controller/productScreenControllers/quantityScreenController.dart';
import 'package:food/screen/product_screens/add_quantity_screen.dart';
import 'package:food/util/customWidgets.dart';
import 'package:food/util/searchBarItems.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class QuantityScreen extends StatelessWidget {
  QuantityController _quantityControllerState;
  // AddProductController _addProductControllerState;

  double commonHeight;

  

  @override
  Widget build(BuildContext context) {
    _quantityControllerState = Provider.of<QuantityController>(context);
    // _addProductControllerState = Provider.of<AddProductController>(context);
    commonHeight = 35;

    return _body();
  }

  Widget _body() {
    return Expanded(
      child: _quantityControllerState.addQualtityFlag
          ? AddQuantityScreen()
          : Container(
              height: double.infinity,
              color: CustomColors.borderLightGreyLineBg,
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
                        child: _quantityDataTable(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _quantityDataTable() {
    return Container(
      
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
              0: FlexColumnWidth(4.0),
              1: FlexColumnWidth(1.8),
            },
            border: TableBorder(
              horizontalInside: BorderSide(
                  width: 1, color: CustomColors.borderLightGreyLineBg),
            ),
            children: [
              TableRow(
                children: [
                  for (var head in _quantityControllerState.infoHeadList)
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
              for (var each in _quantityControllerState.quantityInfoList)
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: _quantityName(text: each),
                      )),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: actionButtons(onPressDelete: () {
                      _quantityControllerState.deleteProduct(
                          _quantityControllerState.quantityInfoList
                              .indexOf(each));
                    }),
                  )
                ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _quantityName({String text}) {
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
                  entries: _quantityControllerState.getQuantityInfoList.length,
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
              _quantityControllerState.onAddQuantityClick();
            },
          ),
        ],
      ),
    );
  }
}
