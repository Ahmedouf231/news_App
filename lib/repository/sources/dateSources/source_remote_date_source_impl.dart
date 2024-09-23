import 'package:news_project/api/apiManger.dart';
import 'package:news_project/models/sourceModel.dart';
import 'package:news_project/repository/sources/source_date_sources.dart';

class SourceRemoteDateSourceImpl implements SourceRemoteDateSource {
  ApiManager apiManager;
  SourceRemoteDateSourceImpl({required this.apiManager});

  @override
  Future<SourceModel?> getSources(String categoryId) async {
   var response = await apiManager.getSourses(categoryId);
   return response;
  }
}
