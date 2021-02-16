import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/controller/productScreenControllers/typeController.dart';
import 'package:food/util/customWidgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddTypeScreen extends StatelessWidget {
  TypeController _typeControllerState;

  OutlineInputBorder kBorderInputData;
  double bodyHeight;
  var commonHeight;
  @override
  Widget build(BuildContext context) {
    commonHeight = 35.0;

    _typeControllerState = Provider.of<TypeController>(context);

    return _body(context);
  }

  Widget _body(context) {
    return Container(
      height: double.infinity,
      width: Get.width,
      color: CustomColors.borderLightGreyLineBg,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  customSaveBtn(onPressed: () {
                    print("Item Added");
                    _typeControllerState.onAddTypeClick();
                  }),
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

  Widget _itemInfo() {
    return Container(
      width: 370,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
            child: Text(
              "Item Type Information",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: xHeaderFont),
            ),
          ),
          _itemInfoBody()
        ],
      ),
    );
  }

  Widget _itemInfoBody() {
    return Container(
     
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
              fontSize: xBodyFont,
            ),
          ),
          SizedBox(height: 10),
          _typeControllerState.image == null
              ? uploadImgBtn(
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
      width: 30,
      height: 30,
      child: ClipRRect(
        child: kIsWeb
            ? Image.network(
                _typeControllerState.image,
              )
            : Image.file(
                _typeControllerState.image,
              ),
      ),
    );
  }

  Widget _itemName() {
    return eachTextFieldItem(
      name: "Item Type Name",
      hint: "Enter item type",
      onChange: (newVal) => _typeControllerState.setName(newVal),
    );
  }
}
