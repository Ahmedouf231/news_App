import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/News/cubit_news/news_states.dart';
import 'package:news_project/api/apiManger.dart';

class NewsWidgetViewModel extends Cubit<NewsStates> {
  NewsWidgetViewModel() : super(NewsLoadingStates());

  //todo: hold date - handle logic

  void getNewsBYSourceId(String sourceId) async {
    emit(NewsLoadingStates());
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        emit( NewsErrorStates(errorMassage: response!.message!));
      }
        if (response?.status == 'ok') {
        emit(NewsSuccessStates(newsList: response!.articles!));
        return;
      }
    } catch (e) {

              emit( NewsErrorStates(errorMassage:e.toString()));

    }
  }
}
