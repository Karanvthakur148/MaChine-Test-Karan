import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Db {
  static late SharedPreferences prefs;
  static const String userLoggedInKey = "LOGGEDINKEY";
  static const String userIdKey = "userIdKey";
  static const String userEMailKey = "USEREMAILKEY";
  static const String userNameKey = "USERENameKEY";
  static const String authTokenKey = "authTokenKey";
  static const String userImageKey = "userImage";
  static const String customerMobileKey = "customerMobileKey";
  static const String setSearchMessageKey = "setSearchMessageKey";

  // static Future<bool> setUserLoggedInStatus(bool isUserLoggedIn) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return await preferences.setBool(userLoggedInKey, isUserLoggedIn);
  // }

  static Future<bool> setUserId(String userId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userIdKey, userId);
  }

  static Future<bool> setUserImage(String userImage) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userImageKey, userImage);
  }

  static Future<bool> saveUserEmail(String userEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userEMailKey, userEmail);
  }

  static Future<bool> saveUserName(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userNameKey, userName);
  }

  static Future<bool> setAuthToken(String authToken) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(authTokenKey, authToken);
  }

  static Future<bool> setCustomerMail(String customerMail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userEMailKey, customerMail);
  }

  static Future<bool> setSearchMessage(String setSearchMessage) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(setSearchMessageKey, setSearchMessage);
  }

//GET USER LOCALDATABASE

  // static Future<bool?> getUserLoggedInStatus() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //
  //   return preferences.getBool(userLoggedInKey);
  // }

  static Future<String?> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(userEMailKey);
  }

  static Future<String?> getUserImage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(userImageKey);
  }

  static Future<String?> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(userNameKey);
  }

  static Future<String?> getUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(userIdKey);
  }

  static Future<String?> getAuthToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(authTokenKey);
  }

  static Future<String?> getCustomerMobileNo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(customerMobileKey);
  }

  static Future<String?> getSearchMessage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(setSearchMessageKey);
  }
}
