import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/util/customWidgets.dart';



class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 0.25, color: CustomColors.borderMedGreyForChkBox),
          borderRadius: BorderRadius.circular(5)),
      height: commonHeight,
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
    );
  }
}
