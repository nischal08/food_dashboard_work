import 'package:flutter/material.dart';
import 'package:food/controller/productController.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AllProductScreen extends StatelessWidget {
  late ProductController _productControllerState;
  @override
  Widget build(BuildContext context) {
    _productControllerState=Provider.of<ProductController>(context);
    return _productControllerState.productScreens[_productControllerState.currentProductIndex];
  }
}
