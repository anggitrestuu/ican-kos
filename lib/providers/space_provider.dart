import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/space.dart';

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpaces() async {
    var result = await http.get(Uri.parse(
        'https://6469fecf03bb12ac209748db.mockapi.io/api/recommended-spaces/spaces'));

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }

  updateIsFavoriteSpace(Space space) async {
    space.isFavorite = !space.isFavorite;

    var url = Uri.parse(
        'https://6469fecf03bb12ac209748db.mockapi.io/api/recommended-spaces/spaces/${space.id}');

    var response = await http.put(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'isFavorite': space.isFavorite}));

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      // Space updated successfully
      // You can perform any additional actions here if needed

      return true;
    } else {
      return false;
      // Failed to update space
      // You can handle the error or display a message to the user
    }
  }
}
