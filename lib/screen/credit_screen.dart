import 'package:flutter/material.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/controller/creditController.dart';
import 'package:food/responsive.dart';
import 'package:food/util/creditSearchbarSection.dart';
import 'package:food/util/customWidgets.dart';
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
                CreditSearchbarSection(),
                customSizedBoxed(height: 25.0),
                _financeDataCard(),
                customSizedBoxed(height: 30.0),
                _paymentData(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _paymentData() {
    return Responsive(
      mobile: _mobileViewPaymentData(),
      desktop: _tabletViewPaymentData(),
      tablet: _mobileViewPaymentData(),
    );
  }

  Widget _tabletViewPaymentData() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(flex: 2, child: _recentsTransaction(text: "Recent Payments")),
        customSizedBoxed(width: 25.0),
        Expanded(flex: 2, child: _recentsPending(text: "Recent Pending")),
        customSizedBoxed(width: 25.0),
        Expanded(flex: 3, child: _customerStat())
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
              child: _recentsTransaction(text: "Recent Payments"),
            ),
            customSizedBoxed(width: 30.0),
            Expanded(
              child: _recentsPending(text: "Recent Pending"),
            ),
          ],
        ),
        customSizedBoxed(height: 30.0),
        _customerStat(customHeight: 350)
      ],
    );
  }

  Widget _recentsTransaction({String text}) {
    return Container(
      width: 270,
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
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customBoldText(text: text),
                customFixedDivider(),
                SizedBox(
                  height: 12,
                ),
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
        right: 14.0,
       top: 4.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "View All",
            style: TextStyle(fontSize: xSmall, color: CustomColors.green),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 10,
            color: CustomColors.green,
          )
        ],
      ),
    );
  }

  Widget _recentsPending({String text}) {
    return Container(
      width: 270,
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
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customBoldText(text: text),
                customFixedDivider(),
                SizedBox(
                  height: 12,
                ),
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

  Widget _customerStat({double customHeight}) {
    return Container(
      padding: EdgeInsets.all(10.0),
      height: customHeight ?? 260,
      width: 416,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            kGeneralBoxShadow,
          ]),
      child: Image.asset(
        "assets/customer stat.jpg",
        fit: BoxFit.fill,
        scale: 1,
      ),
    );
  }

  Widget _eachUserPayDetail(
      {String name, String paymentGetway, String amount}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    fontSize: xBodyFont,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "12/15/2020",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: xSmall,
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
                  fontSize: xBodyFont,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "${paymentGetway == null ? " " : paymentGetway}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: xSmall,
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
            2: FlexColumnWidth(2.4),
            3: FlexColumnWidth(1.9),
            4: FlexColumnWidth(1.3),
            5: FlexColumnWidth(1.5),
            6: FlexColumnWidth(1.5),
            7: FlexColumnWidth(Responsive.isDesktop(Get.context) ? 0.8 : 1.3),
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
                          : _clientInfoName(
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

  Widget _clientInfoName({String text}) {
    return Padding(
      padding: EdgeInsets.only(
        top: 23.0,
        bottom: 23.0,
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
