class ArticleModel {
  Source? source;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? author;
  String? publishedAt;
  String? content;

  ArticleModel(
      {this.source,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.author,
      this.publishedAt,
      this.content});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
