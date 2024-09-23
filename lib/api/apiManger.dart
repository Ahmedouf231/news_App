import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_project/models/news_model.dart';
import 'package:news_project/models/sourceModel.dart';

class ApiManager {
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=8c851111e6f8465185c990a57c0cbf73
   */
   Future<SourceModel?> getSourses(String categoryId ) async {
    try {
      Uri url = Uri.https('newsapi.org', 'v2/top-headlines/sources',
          {'apiKey': '8c851111e6f8465185c990a57c0cbf73',
            'category' : categoryId ,
          });
      var response = await http.get(url);
      var responseBodey = response.body;
      var json = jsonDecode(responseBodey);
      return SourceModel.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=8c851111e6f8465185c990a57c0cbf73
   */
    static Future<NewsModel?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https('newsapi.org', '/v2/everything',
        {'apiKey': '8c851111e6f8465185c990a57c0cbf73', 'sources': sourceId});
    var response = await http.get(url);
    try {
      return NewsModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
