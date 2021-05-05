import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType { normal, success, fail, error }

class ToastConfiguration {
  Color bgColor;
  Color foreColor;
  IconData icon;
  ToastConfiguration(
      {this.bgColor = Colors.black45,
      this.foreColor = Colors.white,
      this.icon = Icons.info_outline});
}

Map<ToastType, ToastConfiguration> _defaultConfigs = {
  ToastType.normal: ToastConfiguration(),
  ToastType.success: ToastConfiguration(
      bgColor: Colors.green.withOpacity(0.8), icon: Icons.check),
  ToastType.fail: ToastConfiguration(
      bgColor: Colors.orange.withOpacity(0.8), icon: Icons.dangerous),
  ToastType.error: ToastConfiguration(
      bgColor: Colors.red.withOpacity(0.8), icon: Icons.dangerous)
};
// _showToast() {
//     Widget toast = Container(
//       padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25.0),
//         color: Colors.greenAccent,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(Icons.check),
//           SizedBox(
//             width: 12.0,
//           ),
//           Text("This is a Custom Toast"),
//         ],
//       ),
//     );

//     fToast.showToast(
//       child: toast,
//       gravity: ToastGravity.BOTTOM,
//       toastDuration: Duration(seconds: 2),
//     );

//     // Custom Toast Position
//     fToast.showToast(
//         child: toast,
//         toastDuration: Duration(seconds: 2),
//         positionedToastBuilder: (context, child) {
//           return Positioned(
//             child: child,
//             top: 16.0,
//             left: 16.0,
//           );
//         });
//   }

class CustomToast {
  ToastType type;
  final BuildContext context;
  String message;
  final _fToast = FToast();
  CustomToast(
      {required this.message,
      this.type = ToastType.normal,
      required this.context}) {
    _fToast.init(context);
  }
  Widget _getUI() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: _defaultConfigs[type]!.bgColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _defaultConfigs[type]!.icon,
            color: _defaultConfigs[type]!.foreColor,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            message,
            style: TextStyle(
              color: _defaultConfigs[type]!.foreColor,
            ),
          ),
        ],
      ),
    );
  }

  void show() {
    _fToast.showToast(
      child: _getUI(),
      toastDuration: Duration(seconds: 4),
      gravity: ToastGravity.BOTTOM,
    );
  }
}
