import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/Responsive.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/controller/productScreenControllers/typeController.dart';
import 'package:food/util/commonMethods.dart';
import 'package:food/util/customWidgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddTypeScreen extends StatelessWidget {
  TypeController _typeControllerState;

  OutlineInputBorder borderData;
  double bodyHeight;
  var commonHeight;
  @override
  Widget build(BuildContext context) {
    bodyHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight + 20.0);
    commonHeight = 35.0;

    _typeControllerState = Provider.of<TypeController>(context);
    borderData = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: Color(0xffD9D9D9),
      ),
    );
    return _body(context);
  }

  Widget _body(context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        width: Get.width,
        color: CustomColors.borderLightGreyLineBg,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.isDesktop(context) ? 40 : 30,
                vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    _saveItemBtn(context),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _backBtn(context),
                    SizedBox(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                _itemInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _backBtn(context) {
    return GestureDetector(
      onTap: () {
        _typeControllerState.onAddTypeClick();
      },
      child: Container(
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_rounded,
              size: 18,
              color: Colors.black87,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "Back",
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _saveItemBtn(context) {
    return Container(
      height: commonHeight,
      child: RaisedButton(
        onPressed: () {
          print("Item Added");
          _typeControllerState.onAddTypeClick();
        },
        elevation: 1,
        child: Text(
          "Save Item",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontFamily: "Roboto"),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: CustomColors.green,
      ),
    );
  }

  Widget _itemInfo() {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
            child: Text(
              "Item Type Information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          _itemInfoBody()
        ],
      ),
    );
  }

  Widget _itemInfoBody() {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            _itemName(),
            SizedBox(height: 20),
            _uploadImg(name: "Choose Image"),
          ],
        ),
      ),
    );
  }

  Widget _uploadImg({String name}) {
    return Container(
      child: Column(
        crossAxisAlignment: _typeControllerState.image == null
            ? CrossAxisAlignment.stretch
            : CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: xHeaderFont,
            ),
          ),
          _typeControllerState.image == null
              ? UploadImgBtn(
                  onPressed: () {
                    _typeControllerState.getImage();
                  },
                )
              : _typeImg()
        ],
      ),
    );
  }

  Widget _typeImg() {
    return Container(
      width: 36,
      height: 36,
      child: kIsWeb
          ? Image.network(
              _typeControllerState.image,
            )
          : Image.file(
              _typeControllerState.image,
            ),
    );
  }

  Widget _itemName() {
    return _eachItem(
      name: "Item Type Name",
      hint: "Enter item type",
      onChange: (newVal) => _typeControllerState.setName(newVal),
    );
  }

  Widget _eachItem({String name, String hint, Function onChange(newVal)}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: getDeviceType()
              ? 30
              : Get.context.isPortrait
                  ? (Get.height * .0345)
                  : (Get.height * .05),
          child: TextFormField(
            onChanged: (String newVal) {
              onChange(newVal);
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                focusedBorder: borderData,
                enabledBorder: borderData,
                contentPadding: EdgeInsets.only(left: 10.0),
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
                filled: true,
                fillColor: Colors.white),
            enabled: true,
          ),
        )
      ],
    );
  }
}
