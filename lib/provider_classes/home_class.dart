import 'dart:convert';

class Home{
   final String author;
   final String title;
   final String description;
   final String urlToImage;
   final String publishedAt;
   final String content;
   //final String url;


   Home({
     required this.author,
     required this.title,
     required this.description,
     required this.urlToImage,
     required this.publishedAt,
     required this.content,
     //required this.url
});

   factory Home.fromJson(Map<String,dynamic>homeJson){
     return Home(
       author: homeJson['author']??'',
       title: homeJson['title']??'',
       description:homeJson['title']??'',
       urlToImage:homeJson['imageUrl']??'',
       publishedAt:homeJson['date']??'',
       content:homeJson['content']??'',
       //url: homeJson['url'],
     );
   }
}