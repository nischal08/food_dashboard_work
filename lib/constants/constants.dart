import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customColors.dart';

String profileImgUrl =
     "https://scontent.fktm8-1.fna.fbcdn.net/v/t1.0-9/122777514_4658406440867560_8980358279672578081_o.jpg?_nc_cat=111&ccb=3&_nc_sid=09cbfe&_nc_ohc=gXszP5UtQ5IAX-yh7IQ&_nc_ht=scontent.fktm8-1.fna&oh=98420b243c6dbe1ea27fdcab531a8196&oe=604FF7D1";

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