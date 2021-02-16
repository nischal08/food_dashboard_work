import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';

double commonHeight = 35;

class CustomCheckbox extends StatelessWidget {
  final bool checkValue;
  final Function onCheckboxClick;
  final Color bgColor;
  CustomCheckbox({
    this.checkValue,
    this.onCheckboxClick,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCheckboxClick,
      child: Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1),
          color: checkValue ? CustomColors.green : Colors.white,
          border: Border.all(
              width: 0.5, color: CustomColors.borderMedGreyForChkBox),
        ),
        child: checkValue
            ? Padding(
                padding: const EdgeInsets.only(
                  bottom: 4.0,
                  right: 2,
                ),
                child: Icon(
                  Icons.check,
                  size: 14.0,
                  color: checkValue ? Colors.white : bgColor,
                ),
              )
            : SizedBox(),
      ),
    );
  }
}

Widget eachTextFieldItem(
      {String name,
      String hint,
      bool isNum = false,
      Function onChange(newVal)}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: xBodyFont),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 35,
          child: TextFormField(
            onChanged: (String newVal) {
              onChange(newVal);
            },
            keyboardType: isNum ? TextInputType.number : TextInputType.name,
            inputFormatters: isNum
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ]
                : null,
            decoration: InputDecoration(
                focusedBorder: kBorderInputData,
                enabledBorder: kBorderInputData,
                contentPadding: EdgeInsets.only(left: 15.0),
                hintText: hint,
                hintStyle: TextStyle(
                  color: CustomColors.textLightGrey,
                  fontSize: xBodyFont,
                ),
                filled: true,
                fillColor: Colors.white),
            enabled: true,
          ),
        )
      ],
    );
  }

Widget backBtn({Function onPressed,String name}) {
    return GestureDetector(
      onTap:onPressed,
      child: Container(
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_rounded,
              size: 12,
               color: CustomColors.textLightGrey,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
             name?? "Back",
              style: TextStyle(
                color: CustomColors.textLightGrey,
                fontSize: xBodyFont,
              ),
            ),
          ],
        ),
      ),
    );
  }


 
 Widget saveItemBtn({Function onPressed,String name}) {
    return Container(
      width: 130,
      height: commonHeight,
      child: RaisedButton(
        onPressed:onPressed,
        elevation: 1,
        child: Text(
          name??"Save Item",
          style: TextStyle(color: Colors.white, fontSize: xHeaderFont),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: CustomColors.green,
      ),
    );
  }

Widget uploadImgBtn({Function onPressed}) {
  return Container(
    height: commonHeight,
    child: RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 0,
      onPressed: onPressed,
      icon: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Icon(
          Icons.add_a_photo,
          size: 20,
        ),
      ),
      label: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 5),
        child: Text(
          "Upload Image",
          style: TextStyle(fontSize: xHeaderFont),
        ),
      ),
    ),
  );
}

class AddEntriesBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: commonHeight,
      height: commonHeight,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xffDBDBDB),
      ),
      child: IconButton(
        onPressed: () {},
        enableFeedback: true,
        icon: Icon(
          Icons.add,
          size: 20,
        ),
      ),
    );
  }
}

class EntriesShowBtn extends StatelessWidget {
  final int entries;
  EntriesShowBtn({this.entries});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: commonHeight,
      child: RaisedButton.icon(
        padding: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        icon: Icon(
          Icons.menu,
          size: 16,
        ),
        label: Transform.translate(
          offset: Offset(-5, 0),
          child: Text(
            "Showing ${entries ?? 0} entries",
            style: TextStyle(fontSize: xBodyFont),
          ),
        ),
        onPressed: () {},
        color: Color(0xffDBDBDB),
      ),
    );
  }
}

Widget addnewBtn({Function onPress}) {
  return Container(
    width: 130.0,
    height: commonHeight,
    child: RaisedButton(
      elevation: 1,
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            size: 18,
            color: Colors.white,
          ),
          Text(
            " Add New",
            style: TextStyle(color: Colors.white, fontSize: xHeaderFont),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: CustomColors.green,
    ),
  );
}

Widget customFixedDivider() {
  return Divider(thickness: 1,
    height: 15,
    color: CustomColors.borderLightGreyLineBg,
  );
}

Text customBoldText({String text}) {
  return Text(
    text,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: xHeaderFont),
  );
}

Widget customSizedBoxed({double height, double width}) {
  return SizedBox(height: height, width: width);
}

Widget actionButtons({Function onPressDelete, Function onPressEdit}) {
  return (Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: onPressEdit,
        child: Container(
          width: 15,
          height: 15,
          child: Image.asset(
            "assets/icons/edit.png",
            color: CustomColors.editActionBtnColor,
          ),
        ),
      ),
      SizedBox(
        width: 15.0,
      ),
      GestureDetector(
        onTap: onPressDelete,
        child: Container(
          width: 15,
          height: 15,
          child: Image.asset(
            "assets/icons/delete.png",
            color: CustomColors.deleteActionBtnColor,
          ),
        ),
      ),
    ],
  ));
}
