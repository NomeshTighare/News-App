import 'dart:convert';

import 'package:http/http.dart';

class NewsArt {
  late String newsHead;
  late String newsDes;
  late String newsImg;
  late String newsUrl;
  NewsArt(
      {this.newsHead = "NEWS HEADLINE",
      this.newsDes = "SOME NEWS",
      this.newsImg = "SOME URL",
      this.newsUrl = "SOME URL"});

  factory NewsArt.fromMap(Map news) {
    return NewsArt(
        newsHead: news["title"],
        newsDes: news["description"],
        newsImg: news["urlToImage"],
        newsUrl: news["url"]);
  }
}
