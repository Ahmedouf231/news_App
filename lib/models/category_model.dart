import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Category {
  String id;
  String title;
  String imagePath;
  Color color;

  Category(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.color});
  /**
    business entertainment  general  health   science  technology
    */

  static List<Category> getCategories() {
    return [
      Category(id:'sports' , title:"Sports",
       imagePath: "assets/images/sports.png", color: Colors.red),
      Category(id:'general' , title:"General",
       imagePath: "assets/images/Politics.png", color: const Color.fromARGB(255, 17, 87, 145)),
      Category(id:'health' , title:"Health",
       imagePath: "assets/images/health.png", color: Color(0xffED1E79)),
      Category(id:'business' , title:"Business",
       imagePath: "assets/images/bussines.png", color: Color(0xffCF7E48)),
      Category(id:'entertainment' , title:"Entertainment",
       imagePath: "assets/images/environment.png", color: Color(0xff4882CF)),
      Category(id:'science', title:"Science",
       imagePath: "assets/images/science.png", color: Color(0xffF2D352)),
    ];
  }
}
