// import 'package:flutter/material.dart';
import 'package:jsend/api_request.dart';
import 'package:jsend/jsend.dart';

class Quantity {
  String id;
  String name;
  Quantity(this.id, this.name);
  static final path = '/quantities';
  static bool _loadedFromServer = false;
  static List<Quantity> all = [];
  static Future<List<Quantity>> allFromServer([bool force = false]) async {
    if (force) _loadedFromServer = false;
    if (!_loadedFromServer) {
      var req = APIRequest(path: path);
      var resp = await req.send();
      var jsendResp = jsendResponse(resp);
      if (jsendResp.status == 'success') {
        all = [];
        for (var rawMap in jsendResp.data) {
          all.add(fromMap(rawMap));
        }
      } else {
        print(jsendResp.toString());
        throw new Exception("Data not loaded from server.");
      }
      _loadedFromServer = true;
    }
    return all;
  }

  static Quantity fromMap(var map) {
    return Quantity(map['_id'], map['name']);
  }

  static void add(Quantity q) {
    if (!all.contains(q)) all.add(q);
  }

  static Future<void> remove(Quantity q) async {
    print('Removing ' + q.name);

    if (all.contains(q)) {
      var req = APIRequest(path: path + '/' + q.id, method: 'DELETE');
      var resp = await req.send();
      var jsonR = jsendResponse(resp);
      if (jsonR.status == 'success') {
        print("deleted");
        all.remove(q);
      } else {
        print(jsonR.toString());
      }
    } else {
      print('Invalid quantity to remove');
    }
  }

  static Future<List<Quantity>> getAll() async {
    // return [
    //   Quantity('23234', '5 pieces'),
    //   Quantity('232d34', '52 pieces'),
    // ];
    return Quantity.allFromServer();
  }
}
