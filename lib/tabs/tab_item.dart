import 'package:flutter/material.dart';
import 'package:news_project/models/sourceModel.dart';

class TabItem extends StatelessWidget {
  TabItem({required this.isSelected, required this.source});
  bool isSelected;
  Source source;
  @override
  Widget build(BuildContext context) {
    return Container( 
      margin: EdgeInsets.only(top: 12),
      padding:EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          border: Border.all(color: Colors.green, width: 3),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        source.name ?? " ",
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.green,
        ),
      ),
    );
  }
}
