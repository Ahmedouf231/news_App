import 'package:flutter/material.dart';
import 'package:news_project/home/category/category_item.dart';
import 'package:news_project/models/category_model.dart';

class CategoryFragment extends StatelessWidget {    
  Function onCategoryClick;
  List<Category> catigorisList = Category.getCategories();
  CategoryFragment({required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Pick your category \n of interest ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategoryClick(catigorisList[index]);
                    },
                    child: CategoryItem(
                      category: catigorisList[index],
                      index: index,
                    ));
              },
              itemCount: catigorisList.length,
            ),
          )
        ],
      ),
    );
  }
}
