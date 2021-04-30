import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/controller/productScreenControllers/quantityScreenController.dart';
import 'package:food/util/customWidgets.dart';
import 'package:get/get.dart';
import 'package:jsend/api_request.dart';
import 'package:jsend/jsend.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class AddQuantityScreen extends StatelessWidget {
  FToast fToast = FToast();
  late QuantityController _quantityControllerState;
  final formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();

  jsendResponse? lastResponse;

  var commonHeight;
  @override
  Widget build(BuildContext context) {
    commonHeight = 35.0;
    if (fToast.context == null) fToast.init(context);
    _quantityControllerState = Provider.of<QuantityController>(context);
    if (_quantityControllerState.toEdit != null) {
      nameController.text = _quantityControllerState.toEdit!.name;
    }

    return _body(context);
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );

    // Custom Toast Position
    fToast.showToast(
        child: toast,
        toastDuration: Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            top: 16.0,
            left: 16.0,
          );
        });
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
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  customSaveBtn(
                    onPressed: () async {
                      // print("Item Added");
                      if (formKey.currentState!.validate()) {
                        print(nameController.text);

                        var req = (_quantityControllerState.toEdit == null)
                            ? APIRequest(
                                path: '/quantities',
                                method: 'POST',
                                payload: {'name': nameController.text})
                            : APIRequest(
                                path: '/quantities/' +
                                    _quantityControllerState.toEdit!.id,
                                method: 'PUT',
                                payload: {'name': nameController.text});
                        var resp;
                        resp = await req.send();
                        lastResponse = jsendResponse(resp);
                        if (lastResponse!.status == 'success') {
                          _quantityControllerState.toEdit!.name =
                              nameController.text;
                          // _showToast();
                          _quantityControllerState.toEdit = null;
                          _quantityControllerState.onAddQuantityClick(true);
                        } else if (lastResponse!.status == 'fail') {
                          formKey.currentState!.validate();
                          lastResponse = null;
                        }
                      } else {
                        print("invalid data");
                      }
                    },
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backBtn(
                    onPressed: () {
                      _quantityControllerState.onAddQuantityClick();
                    },
                  ),
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
      width: 370,
      decoration: BoxDecoration(
        border: kBorderTextFieldkCardkSearchbar,
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
              child: Text(
                "Quantity Information",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: xHeaderFont),
              ),
            ),
          ),
          _itemInfoBody()
        ],
      ),
    );
  }

  Widget _itemInfoBody() {
    return Container(
      // height: 111,
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
          children: [
            SizedBox(height: 20),
            _itemName(),
          ],
        ),
      ),
    );
  }

  Widget _itemName() {
    print("building ");
    return Form(
      key: formKey,
      child: eachTextFieldItem(
          // onChange: (newVal) {
          //   print(newVal);
          // },
          name: "Quantity Name",
          hint: "Enter quantity name",
          validator: (value) {
            if (value == null) {
              return "Empty!!!";
            }
            if (value.trim().length == 0) {
              return "Emtpty!!!";
            }
            if (lastResponse != null) {
              return lastResponse!.errorIn('name');
            }
          },
          controller: nameController),
    );
  }
}
