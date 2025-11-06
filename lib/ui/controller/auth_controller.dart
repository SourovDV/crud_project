import 'dart:convert';

import 'package:crud_project/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{
  static Future<void> saveData(String token , UserModel model)async{
      SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
      sharedPreferences.setString("token", token );
      sharedPreferences.setString("user-model", jsonEncode(model.toJson()));
  }

  static Future<bool> getData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String?token = sharedPreferences.getString("token");
    return token!=null;
  }
}