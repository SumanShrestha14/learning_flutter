import 'dart:convert';
import 'package:first_app/pages/usingAPI/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  List<User> users = [];
  bool loading = false;

  Future<void> fetchUsers() async {
    loading = true;
    notifyListeners();

    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      users = data.map((json) => User.fromJson(json)).toList();
    } else {
      users = [];
    }

    loading = false;
    notifyListeners();
  }
}
