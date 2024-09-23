import 'package:news_project/models/sourceModel.dart';

abstract class SourceRepositry {
  Future<SourceModel?> getSources(String categoryId);
}
