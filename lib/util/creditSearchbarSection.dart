import 'package:flutter/material.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/responsive.dart';
import 'package:food/util/searchBarItems.dart';

import 'customWidgets.dart';

// ignore: must_be_immutable
class CreditSearchbarSection extends StatelessWidget {
  double? _commonHeight;
  @override
  Widget build(BuildContext context) {
    _commonHeight = 35.0;
// Node.ATTRIBUTE_NODE=key(23092)
    return Row(
      children: [
        Expanded(
          flex: Responsive.isDesktop(context) ? 27 : 26,
          child: SearchBar(),
        ),
        customSizedBoxed(
          width: Responsive.isDesktop(context) ? 30 : 15,
        ),
        Expanded(
          flex: Responsive.isDesktop(context)
              ? 5
              : Responsive.isMobile(context)
                  ? 11
                  : 10,
          child: Card(
            elevation: 2,
            color: Colors.white,
            child: Container(
              height: _commonHeight,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Advance Credit",
                      style: TextStyle(
                        fontSize: xHeaderFont,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
          ),
        ),
        customSizedBoxed(
          width: Responsive.isDesktop(context) ? 30 : 15,
        ),
        Expanded(
          flex: Responsive.isDesktop(context)
              ? 4
              : Responsive.isMobile(context)
                  ? 9
                  : 8,
          child: addnewBtn(onPress: () {}),
        ),
      ],
    );
  }
}
