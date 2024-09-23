import 'package:bloc/bloc.dart';
import 'package:news_project/api/apiManger.dart';
import 'package:news_project/home/category/cubit/source_states.dart';
import 'package:news_project/repository/sources/dateSources/source_remote_date_source_impl.dart';
import 'package:news_project/repository/sources/repository/source_repository_impl.dart';
import 'package:news_project/repository/sources/source_date_sources.dart';
import 'package:news_project/repository/sources/source_repositry.dart';

class CategoryDetalisViewModel extends Cubit<SourceStates> {
  late SourceRepositry sourceRepositry;
  late SourceRemoteDateSource remoteDateSource;
  late ApiManager apiManager;
  CategoryDetalisViewModel() : super(SourceLoadingState()) {
    remoteDateSource = SourceRemoteDateSourceImpl(apiManager: apiManager);
    sourceRepositry = SourceRepositoryImpl(remoteDateSource: remoteDateSource);
  }

  void getSources(String categoryId) async {
    try {
      var response = await sourceRepositry.getSources(categoryId);
      emit(SourceLoadingState());
      if (response?.status == 'error') {
        emit(SourceErrorState(errorMassage: response!.message!));
        return;
      }
      if (response?.status == 'ok  ') {
        emit(SourceSuccessState(sourcesList: response!.sources!));
        return;
      }
    } catch (e) {
      emit(SourceErrorState(errorMassage: e.toString()));
    }
  }
}
