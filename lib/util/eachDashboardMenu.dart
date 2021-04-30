import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/controller/homeController.dart';
import 'package:food/controller/productController.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EachDashboardMenuItem extends StatelessWidget {
  late HomeController _homeControllerState;
  late ProductController _productControllerState;
  final String icons;
  final String text;
  final int index;
  IconData? trailling;

  EachDashboardMenuItem({
    required this.icons,
    required this.text,
    required this.index,
     this.trailling,
  });
  @override
  Widget build(BuildContext context) {
    _homeControllerState = Provider.of<HomeController>(context);
    _productControllerState = Provider.of<ProductController>(context);
    return GestureDetector(
      onTap: () {
        Provider.of<HomeController>(context, listen: false).onSelect(index);
        _productControllerState.currentProductIndex == 5 &&
                _homeControllerState.currentMenuItemIndex == index
            ? _homeControllerState.onProductToggle()
            : _productControllerState.onEachProductMenuClick(5);
        _homeControllerState.onSelectProductMenu(4);
      },
      child: Container(
        width: 180.0,
        decoration: BoxDecoration(
            color: _homeControllerState.currentMenuItemIndex == index
                ? CustomColors.green
                : CustomColors.sideMenuColor,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 20.0,
        ),
        margin: EdgeInsets.only(left: 13.0, right: 13.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  child: Image.asset(
                    icons,
                    color: _homeControllerState.currentMenuItemIndex == index
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: xHeaderFont,
                      fontWeight: FontWeight.w400,
                      color: _homeControllerState.currentMenuItemIndex == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            _homeControllerState.currentMenuItemIndex == index
                ? GestureDetector(
                    onTap: () {
                      _homeControllerState.onProductToggle();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        trailling,
                        size: 24,
                        color:
                            _homeControllerState.currentMenuItemIndex == index
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
