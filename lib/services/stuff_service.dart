import 'dart:convert';

import 'package:flutter_movie/models/stuff.dart';
import 'package:flutter_movie/models/response.dart';
import 'package:http/http.dart' as http;

class StuffService {
  final String baseUrl = 'http://10.0.2.2:3000';
  Future<List<Stuff>> getAllMembersOfStuff() async {
    var response = await http.get(Uri.parse('$baseUrl/stuff/all'));
    var responseBody = jsonDecode(response.body);
    var data = Response.fromJson(responseBody);
    if (data.status == 200) {
      List<Stuff> stuff = (data.data as List).map((stuff) => Stuff.fromJson(stuff)).toList();
      return stuff;
    }
    throw Exception(data.message);
  }
}