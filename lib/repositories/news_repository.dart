import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/article.dart';

class NewsRepository {
  Future<List<Article>> getArticles() async {
    await Future.delayed(const Duration(milliseconds: 800));

    final jsonString =
        await rootBundle.loadString('lib/data/mock/mock_news_data.json');
    final json = jsonDecode(jsonString);
    final articles = (json['articles'] as List)
        .map((article) => Article.fromJson(article))
        .toList();
    return articles;
  }

  Future<List<Article>> getArticlesByCategory(String category) async {
    final articles = await getArticles();
    return articles.where((article) => article.category == category).toList();
  }

  Future<Article?> getArticleById(String id) async {
    final articles = await getArticles();
    return articles.firstWhere((article) => article.id == id);
  }
}
