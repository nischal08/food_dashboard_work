import 'package:flutter/material.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';

import 'package:food/controller/creditController.dart';
import 'package:food/responsive.dart';

import 'package:food/util/commonMethods.dart';
import 'package:food/util/customWidgets.dart';
import 'package:food/util/searchBarItems.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CreditDashboard extends StatelessWidget {


  CreditController _adminControllerState;

  CreditController adminController;
  double height;
  double width;
  bool isMenuFixed(BuildContext context) {
    return MediaQuery.of(context).size.width > 500;
  }

  @override
  Widget build(BuildContext context) {
    // commonHeight = 50;
    _adminControllerState = Provider.of<CreditController>(context);
    height = Get.height;
    width = Get.width;
    return _contentBody();
  }

  Widget _contentBody() {
    return Expanded(
      child: Container(

        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 25.0,
            ),
            child: Column(
              children: [
                SearchBarItems(),
                customSizedBoxed(height: 20.0),
                _financeDataCard(),
                customSizedBoxed(height: 20.0),
                _paymentData(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _paymentData() {
    return getDeviceType()
        ? _mobileViewPaymentData()
        : _tabletViewPaymentData();
  }

  Widget _tabletViewPaymentData() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(flex: 3, child: _recentsTransaction(text: "Recent Payments")),
        customSizedBoxed(width: 20.0),
        Expanded(flex: 3, child: _recentsPending(text: "Recent Pending")),
        customSizedBoxed(width: 20.0),
        Expanded(flex: 4, child: _customerStat())
      ],
    );
  }

  Widget _mobileViewPaymentData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                flex: 1, child: _recentsTransaction(text: "Recent Payments")),
            customSizedBoxed(width: 20.0),
            Expanded(flex: 1, child: _recentsPending(text: "Recent Pending")),
          ],
        ),
        customSizedBoxed(height: 20.0),
        _customerStat()
      ],
    );
  }

  Widget _recentsTransaction({String text}) {
    return Container(
       height: 260,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13.0),
          boxShadow: [
            kGeneralBoxShadow,
          ]),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customBoldText(text: text),
                customFixedDivider(),
                _eachUserPayDetail(
                    name: "Niraj Karanjeet",
                    amount: "1000",
                    paymentGetway: "via eSewa"),
                customSizedBoxed(height: 20.0),
                _eachUserPayDetail(
                    name: "Niruta Devkota",
                    amount: "2000",
                    paymentGetway: "via Khati"),
                customSizedBoxed(height: 20.0),
                _eachUserPayDetail(
                  name: "Kriti Gurung",
                  amount: "2000",
                  paymentGetway: "via Cash",
                ),
              ],
            ),
          ),
          _viewAll(),
        ],
      ),
    );
  }

  Widget _viewAll() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 8.0,
        left: 8.0,
        right: 8.0,
        top: getDeviceType() ? 0 : 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "View All",
            style: TextStyle(fontSize: 10.0, color: Colors.green),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 10,
            color: Colors.green,
          )
        ],
      ),
    );
  }

  Widget _recentsPending({String text}) {
    return Container(
       height: 260,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            kGeneralBoxShadow,
          ]),
     
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customBoldText(text: text),
                customFixedDivider(),
                _eachUserPayDetail(
                  name: "Niraj Karanjeet",
                  amount: "1110",
                ),
                customSizedBoxed(height: 20),
                _eachUserPayDetail(
                  name: "Niruta Devkota",
                  amount: "5000",
                ),
                customSizedBoxed(height: 20),
                _eachUserPayDetail(
                  name: "Kriti Gurung",
                  amount: "9000",
                ),
              ],
            ),
          ),
          _viewAll(),
        ],
      ),
    );
  }

  Widget _customerStat() {
    return Container(
      padding: EdgeInsets.all(15.0),
      height: 260,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            kGeneralBoxShadow,
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 19.0),
        child: Image.asset(
          "assets/customer stat.jpg",fit:getDeviceType()?BoxFit.fitWidth: BoxFit.fill,
          scale:1,
        ),
      ),
    );
  }

  Widget _eachUserPayDetail(
      {String name, String paymentGetway, String amount}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(profileImgUrl),
            ),
            customSizedBoxed(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
                Text(
                  "12/15/2020",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Rs. $amount",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${paymentGetway == null ? " " : paymentGetway}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 9,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _financeDataCard() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [kGeneralBoxShadow]),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(1.4),
            1: FlexColumnWidth(1.8),
            2: FlexColumnWidth(2.6),
            3: FlexColumnWidth(1.9),
            4: FlexColumnWidth(1.3),
            5: FlexColumnWidth(1.5),
            6: FlexColumnWidth(1.4),
            7: FlexColumnWidth(Responsive.isDesktop(Get.context) ? 0.8 : 1.2),
          },
          border: TableBorder(
            horizontalInside:
                BorderSide(width: 1, color: CustomColors.borderLightGreyLineBg),
          ),
          children: [
            TableRow(children: [
              for (var head in _adminControllerState.infoHeadList)
                TableCell(
                    child: Padding(
                  padding:
                      const EdgeInsets.only(top: 7.0, bottom: 13.0, left: 7.0),
                  child: Text(
                    head.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: xHeaderFont,
                    ),
                  ),
                ))
            ]),
            for (List eachList in _adminControllerState.infoList)
              TableRow(
                children: [
                  for (var each in eachList)
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: each == false
                          ? Padding(
                              padding: EdgeInsets.only(
                                left: 7.0,
                              ),
                              child: actionButtons(),
                            )
                          : _productName(
                              text: each.toString(),
                            ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _productName({String text}) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.0,
        bottom: 15.0,
        left: 7.0,
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
}
