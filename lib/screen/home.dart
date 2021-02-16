import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/controller/productController.dart';
import 'package:food/util/commonMethods.dart';
import 'package:food/controller/homeController.dart';
import 'package:food/util/eachDashboardMenu.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomeController _homeControllerState;
  ProductController _productControllerState;

  var realOrientation;
  double height;
  double width;

  bool isMenuFixed(BuildContext context) {
    return MediaQuery.of(context).size.width > 500;
  }

  @override
  Widget build(BuildContext context) {
    _homeControllerState = Provider.of<HomeController>(context);
    _productControllerState = Provider.of<ProductController>(context);

    realOrientation = MediaQuery.of(context).orientation;
    height = Get.height;
    width = Get.width;
    // print(realOrientation.toString() + " realOrientation");

    if (getDeviceType()) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: (getDeviceType() ||
              (getDeviceType() == false &&
                  _homeControllerState.getOpacityForOrientation(context) == 1))
          ? _menuSideBar(context)
          : null,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: _appBar(),
      ),
      body: _body(context),
    );
  }

  Widget _body(context) {
    // print(realOrientation.toString() + " orientations");
    return Consumer<HomeController>(builder: (context, homeController, child) {
      return Row(
        children: [
          (getDeviceType() == false &&
                  _homeControllerState.getOpacityForOrientation(context) == 0)
              ? _menuSideBar(context)
              : SizedBox(),
          _homeControllerState.screensList[homeController
              .currentMenuItemIndex], //Using global variable to use the context from the staleless widgets
        ],
      );
    });
  }

  // double _menuSidebarSizeMaintain(context) {
  //   double value;
  //   if (getDeviceType()) {
  //     value = 180;
  //   } else if (!getDeviceType() &&
  //       _homeControllerState.getOpacityForOrientation(context) == 0) {
  //     value = width * 0.17;
  //   } else if (!getDeviceType() &&
  //       _homeControllerState.getOpacityForOrientation(context) == 1) {
  //     value = width * 0.22;
  //     // print("yess it is potrait and tablet");
  //   }

  //   return value;
  // }

  Widget _menuSideBar(context) {
    return SizedBox(
      width: 207.0,
      child: Drawer(
        elevation: 0,
        child: Container(
          color: CustomColors.sideMenuColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                (getDeviceType() ||
                        _homeControllerState
                                .getOpacityForOrientation(context) ==
                            1)
                    ? SizedBox(
                        height: 75,
                        child: DrawerHeader(
                          child: Text(
                            "Menu",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: xHeaderFont),
                          ),
                          margin: EdgeInsets.zero,
                        ),
                      )
                    : SizedBox(height: 5),
                SizedBox(
                  height: 10,
                ),
                EachDashboardMenuItem(
                  icons: "assets/icons/dashboard.png",
                  text: "Dashboard",
                  index: 0,
                ),
                EachDashboardMenuItem(
                  icons: "assets/icons/orders.png",
                  text: "Orders",
                  index: 1,
                ),
                (_homeControllerState.productToggleFlag &&
                        _homeControllerState.currentMenuItemIndex == 2)
                    ? _allProductMenuItem()
                    : EachDashboardMenuItem(
                        icons: "assets/icons/menu.png",
                        text: "Product",
                        index: 2,
                        trailling: Icons.keyboard_arrow_down,
                      ),
                EachDashboardMenuItem(
                  icons: "assets/icons/customer.png",
                  text: "Customers",
                  index: 3,
                ),
                EachDashboardMenuItem(
                  icons: "assets/icons/star.png",
                  text: "Credit",
                  index: 4,
                ),
                EachDashboardMenuItem(
                  icons: "assets/icons/settings.png",
                  text: "Settings",
                  index: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _allProductMenuItem() {
    return Container(
      height: 218,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 13,
            child: _productVariousPage(),
          ),
          EachDashboardMenuItem(
            icons: "assets/icons/menu.png",
            text: "Product",
            index: 2,
            trailling: Icons.keyboard_arrow_down,
          ),
        ],
      ),
    );
  }

  Widget _productVariousPage() {
    return Container(
      width: 180,
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 10.0,
      ),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 6,
          ),
          for (var each in _homeControllerState.productList)
            _eachProductMenuItem(
              label: each,
              index: _homeControllerState.productList.indexOf(each),
            ),
        ],
      ),
    );
  }

  _eachProductMenuItem({String label, int index}) {
    return GestureDetector(
      onTap: () {
        _homeControllerState.onSelectProductMenu(index);
        _productControllerState.onEachProductMenuClick(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Text(
          label,
          style: TextStyle(
              fontSize: xHeaderFont,
              fontWeight: FontWeight.w400,
              color: _homeControllerState.currentProductIndex == index
                  ? CustomColors.green
                  : Colors.black),
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      iconTheme: IconThemeData(color: CustomColors.green),
      title: Text(
        "FOODIZM",
        style: TextStyle(
          color: CustomColors.green,
        ),
      ),
      actions: [
        Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                profileImgUrl,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Niraj Karanjeet",
              style: TextStyle(
                color: CustomColors.borderMedGreyForChkBox,
                fontSize: xHeaderFont,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey.shade600,
            ),
            SizedBox(
              width: 45,
            ),
          ],
        )
      ],
      backgroundColor: Colors.white,
    );
  }
}
