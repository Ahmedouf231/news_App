import 'package:flutter/material.dart';
import 'package:news_project/News/news_widget.dart';
import 'package:news_project/models/sourceModel.dart';
import 'package:news_project/tabs/tab_item.dart';

class TabWidget extends StatefulWidget {
  TabWidget({required this.sourceList});

  List<Source> sourceList; 
  
  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children:[
               TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {     
                });
              },
              isScrollable: true,
              indicatorColor: Colors.transparent, 
              dividerColor: Colors.transparent,
              tabs: widget.sourceList
                  .map(
                      (source) => TabItem(isSelected: selectedIndex == widget.sourceList.indexOf(source) 
                      , source: source))
                  .toList()),
                      Expanded(child: NewsWidget(source: widget.sourceList[selectedIndex],))
          ] ));
  }
}
