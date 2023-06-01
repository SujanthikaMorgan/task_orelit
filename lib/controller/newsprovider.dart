import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/newsmodel.dart';

class NewsProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final NewsModel _news = NewsModel(imageUrl: '', title: '', author: '');

  NewsModel get newsModel => _news;

  Future<List> fetchNewsData(String category) async {
    List<NewsModel> result = [];
    try {
      var response =
      await _dio.get('https://inshorts.deta.dev/news?category=$category');
      //print(response.statusCode);
      if (response.statusCode == 200) {
        var data = response.data;
        List rawData = data['data'];
        rawData.forEach((element) {
          result.add(NewsModel.fromJson(element));
        });
        return result;
        notifyListeners();
      } else {
        return [];
      }
    } catch (e) {
      //print(e);
      return [];
    }
  }

// void updateNews(NewsModel updatedNews) {
//   _news = updatedNews;
//   notifyListeners();
// }
}
