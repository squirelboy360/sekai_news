class Business{
  final String author;
  final String content;
  final String date;
  final String imageUrl;
  final String time;
  final String title;

  Business({
    required this.author,
    required this.content,
    required this.date,
    required this.imageUrl,
    required this.time,
    required this.title
});

  factory Business.fromJson(Map<String,dynamic>businessJson){
    return Business(author: businessJson['author'], content: businessJson['content'], date: businessJson['date'], imageUrl: businessJson['imageUrl'], time:businessJson['time'], title: businessJson['title']);
  }
}