import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future apiFetch() async {
    var request = http.Request(
        'GET', Uri.parse('https://www.episodate.com/api/most-popular?page=1'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      debugPrint(res);
      return res;
    } else {
      debugPrint(response.reasonPhrase);
      return null;
    }
  }

  static Future apiDesc(id) async {
    var request = http.Request(
        'GET', Uri.parse('https://www.episodate.com/api/show-details?q=$id'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      debugPrint(res);
      return res;
    } else {
      debugPrint(response.reasonPhrase);
      return null;
    }
  }
}
