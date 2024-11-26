import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      debugPrint('current weather: $data');
      return jsonDecode(data);
    } else {
      debugPrint(response.statusCode.toString());
    }
  }
}
