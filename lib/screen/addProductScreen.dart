import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/controller/addProductController.dart';
import 'package:food/controller/productController.dart';
import 'package:food/responsive.dart';
import 'package:food/util/customWidgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddProductPage extends StatelessWidget {
  AddProductController _addItemControllerState;
  ProductController _productControllerState;

 

  var commonHeight;
  @override
  Widget build(BuildContext context) {
    commonHeight = 35.0;

    _addItemControllerState = Provider.of<AddProductController>(context);
    _productControllerState = Provider.of<ProductController>(context);
    
    

    return _body(context);
  }

  Widget _body(context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        color: CustomColors.borderLightGreyLineBg,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                saveItemBtn(
                  onPressed: () {
                    print("Item Added");
                    _productControllerState.onAddProductClick();
                    _addItemControllerState.getCategoryCheckItems();
                    _addItemControllerState.getAddonCheckItems();
                  },
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backBtn(onPressed: () {
                  _productControllerState.onAddProductClick();
                }),
                SizedBox(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            _allItemInfo(),
          ],
        ),
      ),
    );
  }

  _allItemInfo() {
    return Column(
      children: [
        Responsive(
          mobile: _mobileViewAllItem(),
          desktop: _webViewAllItem(),
          tablet: _mobileViewAllItem(),
        ),
        SizedBox(
          height: 30,
        ),
        _extra(),
      ],
    );
  }

  Widget _webViewAllItem() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _itemInfo()),
            SizedBox(
              width: 28,
            ),
            Expanded(child: _itemThumbnail()),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _category()),
            SizedBox(
              width: 28,
            ),
            Expanded(child: _addOns()),
          ],
        ),
      ],
    );
  }

  Widget _mobileViewAllItem() {
    return Column(
      children: [
        _itemInfo(),
        SizedBox(
          height: 30,
        ),
        _itemThumbnail(),
        SizedBox(height: 30),
        _category(),
        SizedBox(
          height: 30,
        ),
        _addOns(),
      ],
    );
  }

  Widget _itemInfo() {
    return Container(
      decoration: BoxDecoration(
        border: kBorderTextFieldAndAddCard,
        borderRadius: BorderRadius.circular(
          5,
        ),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 30,
            ),
            child: Text(
              "Item Information",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: xHeaderFont),
            ),
          ),
          _itemInfoBody()
        ],
      ),
    );
  }

  Widget _itemThumbnail() {
    return Container(
      decoration: BoxDecoration(
        border: kBorderTextFieldAndAddCard,
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 30,
            ),
            child: Text(
              "Thumbnail",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: xHeaderFont),
            ),
          ),
          _itemThumbnailBody()
        ],
      ),
    );
  }

  Widget _itemThumbnailBody() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      height: 414,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(Get.context) ? 35 : 50),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          UploadImgBtn(onPressed: () {
            _addItemControllerState.getImage();
          }),
          SizedBox(
            height: 60,
          ),
          _imgPreview()
        ],
      ),
    );
  }

  Widget _imgPreview() {
    return Responsive(
      mobile: _mobResImgPrev(),
      desktop: _webTabResImgPrev(),
      tablet: _mobResImgPrev(),
    );
  }

  Widget _mobResImgPrev() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Image Preview",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: xHeaderFont),
            ),
            SizedBox(
              height: 20.0,
            ),
            _largeImg(),
          ],
        ),
        _tileImg(),
      ],
    );
  }

  Widget _webTabResImgPrev() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Image Preview",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: xBodyFont),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Flexible(
              child: _largeImg(),
            ),
            SizedBox(
              width: 20,
            ),
            Flexible(
              child: _tileImg(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _largeImg() {
    return _eachBoxImg(
      label: "Large Image",
    );
  }

  Widget _tileImg() {
    return _eachBoxImg(
        circleRadiusVal: 100,
        boxShape: BoxShape.circle,
        borderType: BorderType.Circle,
        label: "Tile Display");
  }

  Widget _eachBoxImg(
      {BoxShape boxShape,
      double circleRadiusVal,
      BorderType borderType,
      String label}) {
    return _addItemControllerState.image == null
        ? Container(
            decoration: BoxDecoration(
              shape: boxShape ?? BoxShape.rectangle,
              color: CustomColors.borderLightGreyLineBg,
            ),
            height: 190,
            width: 190,
            child: DottedBorder(
              dashPattern: [8, 8],
              borderType: borderType ?? BorderType.RRect,
              child: Center(
                  child: Text(
                label,
                style: TextStyle(fontSize: xBodyFont),
              )),
            ),
          )
        : Container(
            height: 190,
            width: 190,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(circleRadiusVal ?? 0),
              child: kIsWeb
                  ? Image.network(
                      _addItemControllerState.image,
                    )
                  : Image.file(
                      _addItemControllerState.image,
                    ),
            ),
          );
  }

  Widget _itemInfoBody() {
    return Container(
      height: 414,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 30,
        ),
        child: Column(
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _itemName()),
                SizedBox(
                  width: 35,
                ),
                Expanded(child: _itemQuantity()),
              ],
            ),
            SizedBox(height: 15),
            _type(),
            SizedBox(height: 15),
            _itemDescription(),
            SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(child: _actualPrice()),
              SizedBox(
                width: 35,
              ),
              Expanded(child: _offerPrice()),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _category() {
    return Container(
      decoration: BoxDecoration(
        border: kBorderTextFieldAndAddCard,
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 30,
            ),
            child: Text(
              "Category",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: xHeaderFont),
            ),
          ),
          _categoryBody()
        ],
      ),
    );
  }

  Widget _extra() {
    return Container(
      decoration: BoxDecoration(
        border: kBorderTextFieldAndAddCard,
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 30,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Extra",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: xHeaderFont),
                ),
                Icon(Icons.keyboard_arrow_down)
              ],
            ),
          ),
          _extraBody()
        ],
      ),
    );
  }

  Widget _extraBody() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 30,
      ),
      height: 150,
    );
  }

  Widget _categoryBody() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        right: Responsive.isDesktop(Get.context) ? 20 : 15,
        left: Responsive.isDesktop(Get.context) ? 20 : 15,
      ),
      child: Wrap(direction: Axis.horizontal, children: [
        ..._addItemControllerState.categoryList.keys.map((String key) {
          return key == "add"
              ? Padding(
                  padding: Responsive.isDesktop(Get.context)
                      ? EdgeInsets.only(top: 8.0, left: 8.0)
                      : EdgeInsets.only(top: 15.0, left: 16.0),
                  child: Icon(
                    Icons.add_circle,
                    size: 16,
                    color: CustomColors.green,
                  ),
                )
              : Container(
                  width: 110.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Transform.scale(
                        scale: 0.7,
                        child: Checkbox(
                          focusColor: Colors.blue,
                          value: _addItemControllerState.categoryList[key],
                          activeColor: CustomColors.green,
                          checkColor: Colors.white,
                          onChanged: (bool value) {
                            _addItemControllerState.onChangeCategoryState(
                                newVal: value, currentKey: key);
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          key,
                          style: TextStyle(fontSize: xBodyFont),
                        ),
                      ),
                    ],
                  ),
                );
        }).toList()
      ]),
    );
  }

  Widget _addOns() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 30,
            ),
            child: Text(
              "AddOns",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: xHeaderFont,
              ),
            ),
          ),
          _addOnsBody()
        ],
      ),
    );
  }

  Widget _addOnsBody() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        right: Responsive.isDesktop(Get.context) ? 20 : 15,
        left: Responsive.isDesktop(Get.context) ? 20 : 15,
      ),
      child: Wrap(direction: Axis.horizontal, children: [
        ..._addItemControllerState.addonsList.keys.map((String key) {
          return key == "add"
              ? Padding(
                  padding: Responsive.isDesktop(Get.context)
                      ? EdgeInsets.only(top: 8.0, left: 8.0)
                      : EdgeInsets.only(top: 15.0, left: 16.0),
                  child: Icon(
                    Icons.add_circle,
                    size: 16,
                    color: CustomColors.green,
                  ),
                )
              : Container(
                  width: 110.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Transform.scale(
                        scale: 0.7,
                        child: Checkbox(
                          focusColor: Colors.blue,
                          value: _addItemControllerState.addonsList[key],
                          activeColor: CustomColors.green,
                          checkColor: Colors.white,
                          onChanged: (bool value) {
                            _addItemControllerState.onChangeAddOnsState(
                                newVal: value, currentKey: key);
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          key,
                          style: TextStyle(fontSize: xBodyFont),
                        ),
                      ),
                    ],
                  ),
                );
        }).toList()
      ]),
    );
  }

  Widget _actualPrice() {
    return _eachItem(
      name: "Actual Price",
      hint: "Enter actual price",
      isNum: true,
      onChange: (newVal) => _addItemControllerState.setActualPrice(newVal),
    );
  }

  Widget _offerPrice() {
    return _eachItem(
      name: "Offer price",
      hint: "Enter offer price",
      isNum: true,
      onChange: (newVal) => _addItemControllerState.setActualPrice(newVal),
    );
  }

  Widget _type() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Text(
            "Type",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: xBodyFont),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), border: kBorderTextFieldAndAddCard),
          height: 35,
          child: DropdownButton(
            isExpanded: true,
            icon: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: CustomColors.textLightGrey,
                size: 20,
              ),
            ),
            underline: Container(
              width: 0,
            ),
            onChanged: (newValue) {
              _addItemControllerState.setDropDownType(newValue);
            },
            value: _addItemControllerState.dropdownTypeValue,
            elevation: 16,
            items: <String>["---select---", "Veg", "Non-Veg"]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: xBodyFont,
                        color: CustomColors.textLightGrey,
                      ),
                    ),
                  ));
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget _itemName() {
    return _eachItem(
      name: "Item Name",
      hint: "Enter item Name",
      onChange: (newVal) => _addItemControllerState.setName(newVal),
    );
  }

  Widget _eachItem(
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

  Widget _itemDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
            fontSize: xBodyFont,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 110,
          child: TextFormField(
            maxLines: 6,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                focusedBorder: kBorderInputData,
                enabledBorder: kBorderInputData,
                contentPadding: EdgeInsets.only(
                  left: 15.0,
                  top: 25.0,
                ),
                hintText: "Enter item Name",
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

  Widget _itemQuantity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Quantity",
          style: TextStyle(fontSize: xBodyFont),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: kBorderTextFieldAndAddCard,
          ),
          height: commonHeight,
          child: DropdownButton(
            isExpanded: true,
            icon: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Icon(Icons.keyboard_arrow_down,
                  color: CustomColors.textLightGrey, size: 20),
            ),
            underline: Container(
              width: 0,
            ),
            onChanged: (newValue) {
              _addItemControllerState.setDropDownQuality(newValue);
            },
            value: _addItemControllerState.dropdownQualityValue,
            elevation: 16,
            items: <String>[
              "---select---",
              "1",
              "2",
              "3",
              "4",
              "5",
              "6",
              "7",
              "8",
              "9",
              "10"
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: xBodyFont,
                        color: Colors.black54,
                      ),
                    ),
                  ));
            }).toList(),
          ),
        )
      ],
    );
  }
}
