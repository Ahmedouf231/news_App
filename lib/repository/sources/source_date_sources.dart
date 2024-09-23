import 'package:news_project/models/sourceModel.dart';

abstract class SourceRemoteDateSource { 
  
  Future<SourceModel?> getSources(String categoryId);
}

abstract class SourceLocalDateSource {}
