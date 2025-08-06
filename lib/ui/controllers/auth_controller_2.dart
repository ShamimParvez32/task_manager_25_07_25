/*


import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_25_07_25/data/models/user_model.dart';

class AuthController{

  static String? accessToken;
  static UserModel? userModel;


  static Future<void> saveUserData(String token , UserModel model)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('access-token', token);
    sharedPreferences.setString('user-data', jsonEncode(model.toJson()));
  }


  static Future<void> getUserData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token= sharedPreferences.getString('access-token');
    String? userData= sharedPreferences.getString('user-data');
    accessToken =token;
    userModel=UserModel.fromJson(jsonDecode(userData!));

  }

  static Future<bool> isUserLoggedIn()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('access-token');
    if(token != null){
      await getUserData();
      return true;
    }
    return false;
  }

  static Future<void> clearUserData()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    await sharedPreferences.clear();

  }

}

*/
