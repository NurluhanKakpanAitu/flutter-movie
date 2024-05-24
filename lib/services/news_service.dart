import 'package:flutter_movie/database_helper.dart';
import 'package:flutter_movie/models/news.dart';
import 'package:flutter_movie/models/response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';

class NewsService {
  final String baseUrl = 'http://10.0.2.2:3000';
  final DatabaseHelper db = DatabaseHelper.instance;

  Future<List<News>> getNews() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // Load from local database
      return db.getNews();
    } else {
      // Load from backend and update local database
      var response = await http.get(Uri.parse('$baseUrl/news/all'));
      var responseBody = jsonDecode(response.body);
      var data = Response.fromJson(responseBody);
      if (data.status == 200) {
        List<News> newsList = (data.data as List).map((news) => News.fromJson(news)).toList();
        for (var news in newsList) {
          db.insertNews(news);  // Update local database
        }
        return newsList;
      } else {
        throw Exception(data.message);
      }
    }
  }
  Future<void> addNews(News news) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // Save to local database
      await db.insertNews(news);
    } else {
      // Post to backend and also update local database
      var response = await http.post(
        Uri.parse('$baseUrl/news/create'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(news.toJson()),
      );
      var responseBody = jsonDecode(response.body);
      var data = Response.fromJson(responseBody);
      if (data.status == 200) {
        await db.insertNews(news);  // Update local database
      } else {
        throw Exception(data.message);
      }
    }
  }

  Future<void> updateNews(News news) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // Update local database
      await db.updateNews(news);
    } else {
      // Update backend and local database
      var response = await http.put(
        Uri.parse('$baseUrl/news/update/${news.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(news.toJson()),
      );
      var responseBody = jsonDecode(response.body);
      var data = Response.fromJson(responseBody);
      if (data.status == 200) {
        await db.updateNews(news);  // Update local database
      } else {
        throw Exception(data.message);
      }
    }
  }

  Future<void> deleteNews(String id) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // Delete from local database
      await db.deleteNews(id);
    } else {
      // Delete from backend and local database
      var response = await http.delete(Uri.parse('$baseUrl/news/delete/$id'));
      var responseBody = jsonDecode(response.body);
      var data = Response.fromJson(responseBody);
      if (data.status == 200) {
        await db.deleteNews(id);  // Update local database
      } else {
        throw Exception(data.message);
      }
    }
  }
}
