import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customColors.dart';

BoxShadow kGeneralBoxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.5),
  blurRadius: 6,
  offset: Offset(0, 3),
);


OutlineInputBorder  kBorderInputData = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        width: 0.25,
        color: CustomColors.borderMedGreyForChkBox,
      ),
    );
 Border kBorderTextFieldAndAddCard = Border.all(
      width: 0.25,
      color: CustomColors.borderMedGreyForChkBox,
    );