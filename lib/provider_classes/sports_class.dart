class Sports{
  final String author;
  final String content;
  final String date;
  final String imageUrl;
  final String time;
  final String title;


  Sports({
    required this.author,
    required this.content,
    required this.date,
    required this.imageUrl,
    required this.time,
    required this.title

});
  factory Sports.fromJson(Map<String,dynamic>sportJson){
    return Sports(
      author: sportJson['author']??'',
      content: sportJson['content']??'',
      date: sportJson['date']??'',
      imageUrl: sportJson['imageUrl']??'',
      time: sportJson['time']??'',
      title: sportJson['title']??'',
    );
  }
}
