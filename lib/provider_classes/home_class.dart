import 'dart:convert';

class Home{
   final String author;
   final String title;
   final String description;
   final String urlToImage;
   final String publishedAt;
   final String content;


   Home({
     required this.author,
     required this.title,
     required this.description,
     required this.urlToImage,
     required this.publishedAt,
     required this.content
});

   factory Home.fromJson(Map<String,dynamic>homeJson){
     return Home(
       author: homeJson['author']??'',
       title: homeJson['title']??'',
       description:homeJson['description']??'',
       urlToImage:homeJson['urlToImage']??'',
       publishedAt:homeJson['publishedAt']??'',
       content:homeJson['content']??'',
     );
   }
}