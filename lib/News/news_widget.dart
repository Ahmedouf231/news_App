import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/News/News_item.dart';
import 'package:news_project/News/cubit_news/news_states.dart';
import 'package:news_project/News/cubit_news/news_widget_view_model.dart';
import 'package:news_project/api/apiManger.dart';
import 'package:news_project/models/sourceModel.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({super.key, required this.source});

  Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBYSourceId(widget.source.id??"");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsWidgetViewModel, NewsStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is NewsLoadingStates) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        } else if (state is NewsErrorStates) {
          return Column(
            children: [
              Text(state.errorMassage),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getNewsBYSourceId(widget.source.id??" ");
                  },
                  child: Text("Try again"))
            ],
          );
        } else if (state is NewsSuccessStates) {
          ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: state.newsList[index]);
            },
            itemCount: state.newsList.length,
          );
        }
        return Container(); 
      },
    );

    /*FutureBuilder(
      future: ApiManager.getNewsBySourceId(widget.source.id ?? " "),
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
              Text("somthing went wrong"),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsBySourceId(widget.source.id ?? " ");
                  },
                  child: Text("Try again"))
            ],
          );
        }
        if (snapshot.data!.status != 'ok') {
          Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsBySourceId(widget.source.id ?? " ");
                  },
                  child: Text("Try again"))
            ],
          );
        }
        var newslist = snapshot.data!.articles!;
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItem(news :newslist[index]);
          },
          itemCount: newslist.length,
        );
      },
    );*/
  }
}
