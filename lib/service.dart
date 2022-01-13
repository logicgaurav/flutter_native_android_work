import 'dart:convert';

import 'package:taboola_sampleee/model/article.dart';
import 'package:taboola_sampleee/model/article_detail.dart';
import 'package:http/http.dart';

class ApiService {
  final newsUrl =
      // "https://newsapi.org/v2/top-headlines?country=in&apiKey=d3eeccc1d51e41bcb36f61e97b07cf94&pageSize=20";
      "https://zeenews.india.com/mobileapi/home.php";
  Future<List<Article>> getArticle(String section) async {
    Response response = await get(Uri.parse(newsUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body;
      if (section == 'featuredNews') {
        body = json['featuredNews'];
      } else if (section == 'india') {
        body = json['india'];
      } else {
        body = json['world'];
      }

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("can't get the articles..");
    }
  }

  Future<ArticleDetail> fetchArticleDetail(id) async {
    print("dynamic id=" + id);
    final response = await get(Uri.parse(
        'http://st3.zeenews.india.com/liveapi/english/posts/' +
            id +
            '/index.json'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ArticleDetail.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Article');
    }
  }
}
