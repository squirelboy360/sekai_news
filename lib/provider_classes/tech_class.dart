class Tech{
  final String author;
  final String content;
  final String date;
  final String imageUrl;
  final String time;
  final String title;

  Tech({
    required this.author,
    required this.content,
    required this.date,
    required this.imageUrl,
    required this.time,
    required this.title
});

  factory Tech.fromJson(Map<String,dynamic>techJson){
    return Tech(author: techJson['author']??"", content: techJson['content']??'', date: techJson['date']??'', imageUrl: techJson['imageUrl']??'', time: techJson['time']??'', title: techJson['title']??'');
  }
}