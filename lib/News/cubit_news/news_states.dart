import 'package:news_project/models/news_model.dart';

abstract class NewsStates {}

class NewsIntialStates extends NewsStates {}

class NewsLoadingStates extends NewsStates {}

class NewsErrorStates extends NewsStates {
  String errorMassage;
  NewsErrorStates({required this.errorMassage});
}

class NewsSuccessStates extends NewsStates {
  List<News> newsList;
  NewsSuccessStates({required this.newsList});
}
