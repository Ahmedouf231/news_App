import 'package:news_project/api/apiManger.dart';
import 'package:news_project/models/sourceModel.dart';
import 'package:news_project/repository/sources/dateSources/source_remote_date_source_impl.dart';
import 'package:news_project/repository/sources/source_date_sources.dart';
import 'package:news_project/repository/sources/source_repositry.dart';

class SourceRepositoryImpl implements SourceRepositry {
  SourceRemoteDateSource remoteDateSource;
  SourceRepositoryImpl({required this.remoteDateSource});
  @override
  Future<SourceModel?> getSources(String categoryId) {
    return  remoteDateSource.getSources(categoryId);
  }
}
