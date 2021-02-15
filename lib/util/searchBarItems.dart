import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/util/customWidgets.dart';

class SearchBarItems extends StatelessWidget {
  double _commonHeight;
  @override
  Widget build(BuildContext context) {
    _commonHeight = 35;

    return Row(
      children: [
        customSizedBoxed(
          width: 19,
        ),
        Expanded(
          flex: 27,
          child: SearchBar(),
        ),
        customSizedBoxed(
          width: 13,
        ),
        Expanded(
          flex: 9,
          child: Card(
            elevation: 2,
            color: Colors.white,
            child: Container(
              height: _commonHeight,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 4),
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
          width: 13,
        ),
        Expanded(
            flex: 7,
            child: addnewBtn(onPress: (){}),),
        customSizedBoxed(
          width: 20,
          height: 0,
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-4, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 0.25, color: CustomColors.borderMedGreyForChkBox),
            borderRadius: BorderRadius.circular(5)),
        height: 35,
        child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15),
              hintText: "Search...",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: xBodyFont,
              ),
              suffixIcon: Icon(
                Icons.search,
                size: 19,
                color: Colors.grey,
              ),
              filled: true,
              fillColor: Colors.white,
              enabled: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
