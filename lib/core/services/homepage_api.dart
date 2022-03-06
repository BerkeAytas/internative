import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

class HomepageApi {
  HomepageApi.instance();
  static final HomepageApi _homepageApi = HomepageApi.instance();
  factory HomepageApi() => _homepageApi;

  final _baseURL = "http://test20.internative.net/";

  Future<List> index() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('Token');
    http.Response response = await http.get(Uri.parse(_baseURL + "Blog/GetCategories"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var jsonResponse = convert.jsonDecode(response.body);

    if (response.statusCode == 200) {
      return jsonResponse["Data"];
    } else {
      return [false];
    }
  }

  Future<List> getCategory(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('Token');
    http.Response response = await http.post(Uri.parse(_baseURL + "Blog/GetBlogs"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"CategoryId": id}));
    var jsonResponse = convert.jsonDecode(response.body);

    if (response.statusCode == 200) {
      return jsonResponse["Data"];
    } else {
      return [false];
    }
  }
}
