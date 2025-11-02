import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/convert_patch.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkRespons {
  final int statusCode;

  final bool isSucess;
  final String ? errorMessage;
  final Map<String, dynamic>? responsBody;

  NetworkRespons(
      {required this.statusCode, required this.isSucess, this.errorMessage, this.responsBody});

}


class NetworkCaller {
  static Future<NetworkRespons> getRespons({required String url}) async {
  try{
    Uri uri = Uri.parse(url);
    debugPrint("$uri");
    Response response = await get(uri);
    debugPrint("${response.statusCode}");
    debugPrint("${response.body}");
    if (response.statusCode == 200) {
      final decodeRespons = jsonDecode(response.body);
      return NetworkRespons(
          statusCode: response.statusCode,
          isSucess: true,
          responsBody: decodeRespons);
    } else {
      return NetworkRespons(
          statusCode: response.statusCode,
          isSucess: false);
    }
  }catch(e){
    return NetworkRespons(statusCode: -1, isSucess: false,errorMessage: e.toString());
  }
  }
  static Future<NetworkRespons> postRespons({required String url,Map<String,dynamic>?body}) async {
    try{
      Uri uri = Uri.parse(url);
      debugPrint("$uri");
      Response response = await post(uri, headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body));
      debugPrint("${response.statusCode}");
      debugPrint("${response.body}");
      if (response.statusCode == 200) {
        final decodeRespons = jsonDecode(response.body);
        return NetworkRespons(
            statusCode: response.statusCode,
            isSucess: true,
            responsBody: decodeRespons);
      } else {
        return NetworkRespons(
            statusCode: response.statusCode,
            isSucess: false);
      }
    }catch(e){
      return NetworkRespons(statusCode: -1, isSucess: false,errorMessage: e.toString());
    }
  }


}