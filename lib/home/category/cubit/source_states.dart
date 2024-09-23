import 'package:news_project/models/sourceModel.dart';

abstract class SourceStates {}

class SourceInitialState extends SourceStates {}

class SourceLoadingState extends SourceStates {}

class SourceErrorState extends SourceStates {
  String errorMassage;
  SourceErrorState({required this.errorMassage});
}
class SourceSuccessState extends SourceStates {
  List<Source> sourcesList;
  SourceSuccessState({required this.sourcesList});
}
