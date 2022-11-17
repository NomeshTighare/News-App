import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/model/newsmodel.dart';

class News {
  // save json data inside this
  List<ArticleModel> datatobesavedin = [];

  Future<void> getNews() async {
    var response = await get(Uri.parse(
        'http://newsapi.org/v2/top-headlines?country=in&apiKey=680f4751d77c49ad9f5d5f36457a6251'));
    var jsonData = jsonDecode(response.body);
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['source'] != null) {
          // initliaze our model class

          ArticleModel articleModel = ArticleModel.fromJson(element);

          datatobesavedin.add(articleModel);
        }
      });
    }
  }
}

class NewsTechno {
  List<ArticleModel> datatobesavedinTechno = [];
  // fetch news technology category
  Future<void> getNewsTechnology() async {
    var response = await get(Uri.parse(
        'http://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=680f4751d77c49ad9f5d5f36457a6251'));
    var jsonData = jsonDecode(response.body);
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['source'] != null) {
          // initliaze our model class

          ArticleModel articleTechnology = ArticleModel.fromJson(element);

          datatobesavedinTechno.add(articleTechnology);
        }
      });
    }
  }
}

// fetching news by  category
class CategoryNews {
  List<ArticleModel> datatobesavedin = [];

  Future<void> getNews(String category) async {
    var response = await get(Uri.parse(
        'http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=680f4751d77c49ad9f5d5f36457a6251'));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['source'] != null) {
          // initliaze our model class

          ArticleModel articleModel = ArticleModel.fromJson(element);

          datatobesavedin.add(articleModel);
        }
      });
    }
  }
}
