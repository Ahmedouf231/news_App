import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_project/models/news_model.dart';

class NewsItem extends StatelessWidget {
  NewsItem({super.key, required this.news});
  News news;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: CachedNetworkImage(
            imageUrl: news.urlToImage??" ",
            fit: BoxFit.fill,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
         ),
            ) , 
            SizedBox(
              height: 12,
            ),
            Text(news.author??" " , 
            style:TextStyle(fontSize: 18 , fontWeight: FontWeight.w400 , 
            color: Colors.grey)),
             SizedBox(
              height: 12,
            ),
            Text(news.title??" " , 
            style:TextStyle(fontSize: 20 , fontWeight: FontWeight.w400)),
             SizedBox(
              height: 12,
            ),
            Text(news.publishedAt??" " , 
            style:TextStyle(fontSize: 20 , fontWeight: FontWeight.w400), 
            textAlign: TextAlign.end,),
             SizedBox(
              height: 12,
            ),
            Divider(
              color: Colors.grey,
              thickness: 3,
            )
        
          ],
        ),
      ),
    );
  }
}
