import 'dart:convert';

import 'package:gjson/tools/json_to_x.dart';

class JSONToDart extends JSONToX {
  @override
  String jsonToCode(String jsonStr) {
    Map<String, dynamic> json = jsonDecode(jsonStr);

    return '';
  }
}
