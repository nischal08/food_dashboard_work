import 'package:flutter/material.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';

import 'package:food/controller/creditController.dart';

import 'package:food/util/commonMethods.dart';
import 'package:food/util/customWidgets.dart';
import 'package:food/util/searchBarItems.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CreditDashboard extends StatelessWidget {
  double commonHeight;

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
        color: Color(0xffF4F4F4),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              customSizedBoxed(height: 20),
              SearchBarItems(),
              customSizedBoxed(height: 5),
              _financeDataCard(),
              customSizedBoxed(height: 10),
              _paymentData(),
              customSizedBoxed(height: 20),
            ],
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
        Expanded(flex: 3, child: _recentsPending(text: "Recent Pending")),
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
            Expanded(flex: 1, child: _recentsPending(text: "Recent Pending")),
            customSizedBoxed(width: 20)
          ],
        ),
        customSizedBoxed(height: 20),
        _customerStat()
      ],
    );
  }

  Widget _recentsTransaction({String text}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            kGeneralBoxShadow,
          ]),
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customBoldText(text: text),
                customFixedDivider(),
                _eachUserPayDetail(
                    name: "Niraj Karanjeet",
                    amount: "1000",
                    paymentGetway: "via eSewa"),
                customSizedBoxed(height: 20),
                _eachUserPayDetail(
                    name: "Niruta Devkota",
                    amount: "2000",
                    paymentGetway: "via Khati"),
                customSizedBoxed(height: 20),
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
            style: TextStyle(fontSize: 10, color: Colors.green),
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
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            kGeneralBoxShadow,
          ]),
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(17.0),
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
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
           kGeneralBoxShadow,
          ]),
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 19),
        child: Image.asset(
          "assets/customer stat.jpg",
          scale: getDeviceType() ? 2.1 : 4.5,
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
      //elevation: 1,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
            6: FlexColumnWidth(1.3),
            7: FlexColumnWidth(1.2),
          },
          border: TableBorder(
            horizontalInside:
                BorderSide(width: 0.5, color: CustomColors.borderLightGreyLineBg),
            // bottom: BorderSide(width: 1, color: Colors.red)
          ),
          children: [
            TableRow(children: [
              for (var head in _adminControllerState.infoHeadList)
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.only(
                    top: 7.0,
                    bottom: 13.0,
                  ),
                  child: Text(
                    head.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ))
            ]),
            for (List eachList in _adminControllerState.infoList)
              TableRow(
                children: [
                  for (var each in eachList)
                    TableCell(
                      child: each == false
                          ? actionButtons()
                          : Padding(
                              padding: EdgeInsets.only(
                                top: 17.0,
                                bottom: 7.0,
                              ),
                              child: Text(
                                each.toString(),
                              ),
                            ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
