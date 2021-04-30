import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/controller/productScreenControllers/categoryScreenController.dart';
import 'package:food/util/customWidgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddCategoryScreen extends StatefulWidget {
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  late CategoryController _categoryControllerState;

  OutlineInputBorder? kBorderOutlineTextField;

  var commonHeight;

  @override
  Widget build(BuildContext context) {
    commonHeight = 35.0;

    _categoryControllerState = Provider.of<CategoryController>(context);

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
                    _categoryControllerState.onAddCategoryClick();
                  }),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backBtn(onPressed: () {
                    _categoryControllerState.onAddCategoryClick();
                  }),
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

  Widget _itemInfo() {
    return Container(
      width: 750,
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
              "Category Information",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: xHeaderFont),
            ),
          ),
          _itemInfoBody()
        ],
      ),
    );
  }

  Widget _itemInfoBody() {
    return Container(
      height: 325,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 30,
      ),
      child: Row(
      
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                _itemName(),
                SizedBox(height: 20),
                _chooseColor(),
                SizedBox(height: 20),
                _chooseThumbnail(),
              ],
            ),
          ),
          SizedBox(width: 179),
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
                  height: 20,
                ),
              Text(
                "Preview Outcome",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: xBodyFont),
              ),
              SizedBox(
                height: 10.0,
              ),
              _largeImg(),
          ],
        ),
            ),
          ),

        ],
      ),
    );
  }

 Widget _largeImg() {
    return _eachBoxImg(
      label: "Tile Display",
    );
  }

   Widget _eachBoxImg(
      {BoxShape? boxShape,
      BorderType? borderType,
      required String label}) {
    return _categoryControllerState.image == null
        ? Container(
            decoration: BoxDecoration(
              shape: boxShape ?? BoxShape.rectangle,
              color: CustomColors.borderLightGreyLineBg,
            ),
            height: 190,
            width: 171,
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
            width: 171,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: kIsWeb
                  ? Image.network(
                     _categoryControllerState.image ,
                    )
                  : Image.file(
                      _categoryControllerState.image,
                    ),
            ),
          );
  }


  Widget _itemName() {
    return eachTextFieldItem(
      name: "Category Name",
      hint: "Enter Category Name",
      // onChange: (newVal) => _categoryControllerState.setName(newVal),
    );
  }

  Widget _chooseColor() {
    return _colorChoose(
      name: "Choose Color",
    );
  }

  Widget _chooseThumbnail() {
    return _thumbnail(name: "Choose Thumbnail");
  }

  Widget _colorChoose({required String name}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: xBodyFont,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 35,
          child: customSaveBtn( fontSize: xBodyFont,
              name: "Select Color",
              color: CustomColors.colorInfoThumbnailHeader,
              textColor: Colors.black,
              onPressed: () {}),
        )
      ],
    );
  }

  Widget _thumbnail({required String name}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: xBodyFont,
            ),
          ),
          SizedBox(height: 10),
          uploadImgBtn(fontSize:  xBodyFont,
            onPressed: () {
               _categoryControllerState.getImage();
            },
          )
        ],
      ),
    );
  }
}
