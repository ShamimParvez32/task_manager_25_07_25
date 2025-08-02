import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_25_07_25/data/models/user_model.dart';

class AuthController{
  static String? accessToken;
  static UserModel? userModel;
  
  static const String _accessTokenKey='access-token';
  static const String _userDataKey='user-data';
  
  
  static Future<void> saveUserData(String token, UserModel model)async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    sharedPreferences.setString(_accessTokenKey, token);
    sharedPreferences.setString(_userDataKey, jsonEncode(model.toJson()));accessToken =token;
  }
  
  static Future<void> getUserData( )async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);
    String? userData = sharedPreferences.getString(_userDataKey);
    accessToken =token;
    userModel =UserModel.fromJson(jsonDecode(userData!));
  }
  


  static Future<bool> isUserLoggedIn ()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);
    if(token != null){
      await getUserData();
      return true;
    }
    return false;
  }

  static Future<void> clearUserData() async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }


}