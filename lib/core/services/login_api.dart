import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

class Api {
  Api.instance();
  static final Api _api = Api.instance();
  factory Api() => _api;

  final _baseURL = "http://test20.internative.net/";

  Future<bool> login(Map<String, dynamic> body) async {
    Uri url = Uri.parse(_baseURL + "Login/SignIn");
    http.Response response =
        await http.post(url, headers: {"Content-Type": "application/json"}, body: json.encode(body));

    var jsonResponse = convert.jsonDecode(response.body);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Token', jsonResponse["Data"]["Token"]);
    return jsonResponse["HasError"] ? false : true;
  }

  Future<bool> signUp(Map<String, dynamic> body) async {
    Uri url = Uri.parse(_baseURL + "Login/SignUp");
    http.Response response =
        await http.post(url, headers: {"Content-Type": "application/json"}, body: json.encode(body));

    var jsonResponse = convert.jsonDecode(response.body);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Token', jsonResponse["Data"]["Token"]);
    return jsonResponse["HasError"] ? false : true;
  }
}
