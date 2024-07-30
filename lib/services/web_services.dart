import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:machine_test_flutter/home_page/home_screen.dart';
import 'package:machine_test_flutter/services/model/user_list_model.dart';
import 'package:machine_test_flutter/services/server_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/signin_screen.dart';
import 'db.dart';

class WebService {
  // static Future<void> registerRequest(String name, String email, String password, BuildContext context, String mobileNumber) async {
  //   var request = {};
  //   request["email"] = email;
  //   request["password"] = password;
  //   request["phone"] = mobileNumber;
  //   request["name"] = name;
  //   print(request);
  //
  //   var response = await http.post(
  //     Uri.parse(ServerDetails.registration),
  //     body: convert.jsonEncode(request),
  //     headers: {"accept": "application/json", "Content-Type": "application/json"},
  //   );
  //   log('this response of new api${response.body}');
  //
  //   Map<String, dynamic> jsonResponse = json.decode(utf8.decode(response.bodyBytes));
  //   print(jsonResponse);
  //
  //   if (jsonResponse["status"] == "Success") {
  //     Db.setCustomerMail(email);
  //     nextScreen(context, VerifyOtpScreen(email: email));
  //     // Fluttertoast.showToast(msg: jsonResponse["message"]);
  //     // final route =
  //     //     MaterialPageRoute(builder: (context) => MainNavigationPage());
  //     // Navigator.pushAndRemoveUntil(context, route, (route) => false);
  //   } else {
  //     Fluttertoast.showToast(msg: jsonResponse["message"]);
  //   }
  // }

  static Future<void> logInRequest(String password, BuildContext context, String email) async {
    var request = {};
    request["password"] = password;
    request["email"] = email;

    var response = await http.post(
      Uri.parse(ServerDetails.logIn),
      body: jsonEncode(request),
      headers: {"accept": "application/json", "Content-Type": "application/json"},
    );

    log('this response of new api ${response.body}');

    Map<String, dynamic> jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    if (jsonResponse["status"] == true) {
      await Db.setAuthToken(jsonResponse["record"]["authtoken"].toString());
      await Db.setUserId(jsonResponse["record"]["id"].toString());
      await Db.saveUserName(jsonResponse["record"]["firstName"].toString() + " " + jsonResponse["record"]["lastName"].toString());
      await Db.saveUserEmail(jsonResponse["record"]["email"].toString());
      await Db.setUserImage(jsonResponse["record"]["profileImg"].toString());
      //await Db.setCustomerMail(email);

      log("authtoken123 " + jsonResponse["record"]["authtoken"].toString());

      final route = MaterialPageRoute(builder: (context) => HomeScreen());
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
      Fluttertoast.showToast(msg: jsonResponse["message"]);
    } else {
      Fluttertoast.showToast(msg: jsonResponse["message"]);
    }
  }

  static Future<void> signUpRequest(
    BuildContext context,
    String email,
    String password,
    confirmPassword,
    firstName,
    lastName,
    countryCode,
    phoneNo,
  ) async {
    var request = {};
    request["first_name"] = firstName;
    request["last_name"] = lastName;
    request["country_code"] = countryCode;
    request["phone_no"] = phoneNo;
    request["email"] = email;
    request["password"] = password;
    request["confirm_password"] = confirmPassword;

    var response = await http.post(
      Uri.parse(ServerDetails.registration),
      body: jsonEncode(request),
      headers: {"accept": "application/json", "Content-Type": "application/json"},
    );

    log('this response of new api ${response.body}');

    Map<String, dynamic> jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    if (jsonResponse["status"] == true) {
      await Db.setAuthToken(jsonResponse["token"].toString());
      await Db.setUserId(jsonResponse["id"].toString());
      //await Db.setCustomerMail(email);

      final route = MaterialPageRoute(builder: (context) => HomeScreen());
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
      Fluttertoast.showToast(msg: jsonResponse["message"]);
    } else {
      Fluttertoast.showToast(msg: jsonResponse["message"]);
    }
  }

  static Future<void> logOutRequest(BuildContext context) async {
    String? authToken;
    await Db.getAuthToken().then((value) {
      authToken = value!;
    });

    var response = await http.get(
      Uri.parse(ServerDetails.logout),
      headers: {
        "accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer $authToken',
      },
    );
    log('this response of new api${response.body}');

    Map<String, dynamic> jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    print(jsonResponse);
    if (jsonResponse["status"] == true) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.clear();
      Fluttertoast.showToast(msg: jsonResponse["message"]);
      final route = MaterialPageRoute(builder: (context) => AuthScreen());
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    } else if (jsonResponse["message"] == "Unauthenticated.") {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.clear();
      final route = MaterialPageRoute(builder: (context) => AuthScreen());
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    } else {
      Fluttertoast.showToast(msg: jsonResponse["message"]);
    }
  }

  static Future<UserListModel?> getUserDetailsRequest(BuildContext context) async {
    String? authToken;
    await Db.getAuthToken().then((value) {
      authToken = value!;
    });
    var response = await http.get(Uri.parse(ServerDetails.userList), headers: {
      "content-type": "application/json",
      "accept": "application/json",
      'Authorization': 'Bearer $authToken',
    });

    var jsonResponse = convert.jsonDecode(response.body);
    log('this response of userDetails api${response.body}');
    UserListModel? userListModel;
    if (jsonResponse["status"] == true) {
      print(authToken);

      userListModel = userListModelFromJson(response.body);
    } else if (jsonResponse["message"] == "Unauthenticated.") {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.clear();
      // final route = MaterialPageRoute(builder: (context) => const LogInScreen());
      // Navigator.pushAndRemoveUntil(context, route, (route) => false);
    } else {}
    return userListModel;
  }
}
