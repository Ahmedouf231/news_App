import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_project/api/apiManger.dart';
import 'package:news_project/home/category/category_detalis.dart';
import 'package:news_project/home/category/category_fragment.dart';
import 'package:news_project/home/drawer.dart/home_drawer.dart';
import 'package:news_project/models/category_model.dart';
import 'package:news_project/models/sourceModel.dart';
import 'package:news_project/settings.dart';
import 'package:news_project/tabs/tab_widget.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        title: Text( 
          selectedItem == HomeDrawer.settings ?"settings" :
          selectedCategory == null ?
          "News App " : selectedCategory!.title,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: HomeDrawer(
          onSideMenuItemClick: onSeideMenuItemClick,
        ),
      ),
      body: selectedItem == HomeDrawer.settings
          ? Settings()
          : selectedCategory == null
              ? CategoryFragment(onCategoryClick: onCategaryItemClicked)
              : CategoryDetalis(
                  category: selectedCategory!,
                ),
    );
  }

  Category? selectedCategory;

  void onCategaryItemClicked(Category newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  int selectedItem = HomeDrawer.categories;
  void onSeideMenuItemClick(int newSelectedItem) {
    selectedItem = newSelectedItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
