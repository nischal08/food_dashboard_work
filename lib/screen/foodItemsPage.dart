import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/util/customWidgets.dart';
import 'package:food/util/searchBarItems.dart';
import 'package:get/get.dart';

class FoodItemsPage extends StatelessWidget {
  double _commonHeight;
  @override
  Widget build(BuildContext context) {
    _commonHeight = getDeviceType()
        ? 30
        : context.isPortrait
            ? (Get.height * .035)
            : (Get.height * .05);
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        color: Color(0xffF4F4F4),
        child: Column(
          children: [
            _searchBarItems(),
          ],
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
                Container(
                  height: _commonHeight,
                  child: RaisedButton.icon(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    icon: Icon(
                      Icons.menu,
                      size: 18,
                    ),
                    label: Text("Showing 6 entries"),
                    onPressed: () {},
                    color: Color(0xffDBDBDB),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: _commonHeight,
                  height: _commonHeight,
                  child: Card(
                    child: Icon(
                      Icons.add,
                      size: 20,
                    ),
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Color(0xffDBDBDB),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: _commonHeight,
            child: RaisedButton(
              elevation: 1,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 14,
                    color: Colors.white,
                  ),
                  Text(
                    "Add New",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              color: Color(0xff7FC66E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}