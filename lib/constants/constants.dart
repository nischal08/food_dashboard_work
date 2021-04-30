import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customColors.dart';

String profileImgUrl = "https://avatars.githubusercontent.com/u/29170237?v=4";

BoxShadow kGeneralBoxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.5),
  blurRadius: 6,
  offset: Offset(0, 3),
);

OutlineInputBorder kBorderOutlineTextField = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: BorderSide(
    width: 0.25,
    color: CustomColors.borderMedGreyForChkBox,
  ),
);
Border kBorderTextFieldkCardkSearchbar = Border.all(
  width: 0.25,
  color: CustomColors.borderMedGreyForChkBox,
);
