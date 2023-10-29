import 'dart:convert';

import 'package:http/http.dart' as http;
import 'user.dart';

class HTTP {
  Future<List<QUser>> fetchScores(String userid) async {
      final response = await http
          .get(Uri.parse('http://localhost:3000/scores?userid=$userid'));

      if (response.statusCode == 200) {
        var scoresJson = jsonDecode(response.body)['scores'] as List;
        List<QUser> scores = scoresJson.map((tagJson) => QUser.fromJson(tagJson)).toList();
        print(scores);
        return scores;
      } else {
        throw Exception('Failed to load scores');
      }
    }
  void createUser(QUser user) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toMap()),
    );

    if (response.statusCode == 200) {
      print("Success");
    } else {
      throw Exception('Failed to load scores');
    }
  }
}