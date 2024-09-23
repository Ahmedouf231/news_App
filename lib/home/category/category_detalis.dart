import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/api/apiManger.dart';
import 'package:news_project/home/category/cubit/category_details_view_model.dart';
import 'package:news_project/home/category/cubit/source_states.dart';
import 'package:news_project/models/category_model.dart';
import 'package:news_project/models/sourceModel.dart';
import 'package:news_project/tabs/tab_widget.dart';

class CategoryDetalis extends StatefulWidget {
  Category category;
  CategoryDetalis({required this.category});

  @override
  State<CategoryDetalis> createState() => _CategoryDetalisState();
}

class _CategoryDetalisState extends State<CategoryDetalis> {
  CategoryDetalisViewModel viewModel = CategoryDetalisViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetalisViewModel, SourceStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourceLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        } else if (state is SourceErrorState) {
          Column(
            children: [
              Text(state.errorMassage),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getSources(widget.category.id);
                  },
                  child: Text("Try again"))
            ],
          );
        } else if (state is SourceSuccessState) {
          return TabWidget(sourceList: state.sourcesList);
        }
        return Container();
      },
    );

    /*FutureBuilder<SourceModel?>(
      future: ApiManager.getSourses(category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text("something went wrong"),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSourses(category.id);
                  },
                  child: Text("Try again"))
            ],
          );
        }
        if (snapshot.data!.status == 'error') {
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSourses(category.id);
                  },
                  child: Text("Try again"))
            ],
          );
        }
        var sourcesList = snapshot.data!.sources!;
        return TabWidget(sourceList: sourcesList);
      },
    ); */
  }
}
