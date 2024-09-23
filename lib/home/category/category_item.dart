import 'package:flutter/material.dart';
import 'package:news_project/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;
  CategoryItem({required this.category , required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration( 
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(index %2 == 0 ? 25 : 0), 
          bottomRight: Radius.circular(index %2 != 0 ? 25 : 0),
          topLeft: Radius.circular(25) ,
          topRight: Radius.circular(25) ,
        ),
        color: category.color,
      ),
      child: Column( 
        children: [
          Image.asset(
            category.imagePath,
            height: MediaQuery.of(context).size.height *0.15,
          ),
          Text(category.title , style: TextStyle(
            color: Colors.white,
          )),
        ],
      ),
    );
  }
}
