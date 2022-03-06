import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Api {
  Api.instance();
  static final Api _api = Api.instance();
  factory Api() => _api;

  final _baseURL = "http://test20.internative.net/swagger/";

  Future<bool> login(Map<String, dynamic> body) async {
    //showProgressDialog("Giriş Yapılıyor...");
    Uri url = Uri.parse(_baseURL + "Login/SignIn");
    print(url);
    http.Response response = await http.post(url, body: body);
    var jsonResponse = convert.jsonDecode(response.body);
    if (jsonResponse != 0) {
      print(jsonResponse);
      return true;
    }
    /*http.Response response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);
    //closeProgressDialog();

    if (jsonResponse.toString() != "[]") {
      print(jsonResponse);
      //final storageController = StorageController();
      //storageController.saveLogin(jsonResponse);

      //User.fromJson(jsonResponse[0]);
      return true;
    }*/
    return false;
  }
}
