import 'package:api_test/model/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Future<List<Welcome>> getApiData() async {
    try {
      http.Response response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        List<Welcome> mapData =
            data.map((item) => Welcome.fromJson(item)).toList();
        return mapData;
      } else {
        throw Exception(' Failed to load Data');
      }
    } catch (err) {
      print(err);
      throw err;
    }
  }
}
