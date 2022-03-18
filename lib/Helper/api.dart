import 'package:http/http.dart' as http;

import 'dart:convert';

class Api {
  var baseUrl = "https://mobile-tha-server.firebaseapp.com/walmartproducts/5/5";

  Future<dynamic> hitApi() async {
    try {
      var url = Uri.parse(baseUrl);
      final response = await http.get(url);
      return json.decode(response.body) as Map;
    } catch (error) {
      print("Getting error=$error");
      return;
    }
  }
}
