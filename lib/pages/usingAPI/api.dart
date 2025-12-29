import 'dart:async';
import 'dart:convert';
import 'package:first_app/pages/usingAPI/UserModel.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class API {
  // -------------------- API CALL --------------------
  Future<List<User>> fetchUsers() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users/'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        debugPrint(response.body);
        return data.map((e) => User.fromJson(e)).toList();
      } else {
        debugPrint(response.body);
        throw Exception("Failed to load users: ${response.statusCode}");
      }
    } on http.ClientException catch (e) {
      throw Exception("Network error: ${e.message}");
    } on TimeoutException {
      throw Exception("Request timeout");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
