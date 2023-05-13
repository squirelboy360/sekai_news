import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sekai_news/screens/main_screens/detailed_screens/home_detailed_screen.dart';

import '../../provider_classes/home_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Home>_news=[];

Future<void>fetchGeneralNews()async{
  final respose= await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=203812b9d4234c7985b282e6839d3122'));

  if(respose.statusCode==200){
   //decode data
    final data = jsonDecode(respose.body);
    setState(() {
      _news=List.from(data['articles']).map((e) => Home.fromJson(e)).toList();
    });
  }else{
    throw Exception('error');
  };

}


@override
void initState() {
   fetchGeneralNews();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: NestedScrollView(
       headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
           title: Text('General News',style: GoogleFonts.albertSans(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white70)),
           expandedHeight: 200,
           flexibleSpace: FlexibleSpaceBar(
             background: Image.asset('assets/1.png',fit: BoxFit.cover,filterQuality: FilterQuality.high,colorBlendMode: BlendMode.colorBurn),
           ),
           floating: true,
           pinned: true,
           elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
         ),
       ],
       body: ListView.builder(itemCount: _news.length,itemBuilder: (context,index){
         final news=_news[index];
         return Padding(
           padding: const EdgeInsets.all(8.0),
           child: InkWell(
             onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeDetailedScreen(content: news.content,src: news.urlToImage,)));
             },
             child: ListTile(
               title: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Hero(tag: news.urlToImage,child: ClipRRect(borderRadius: BorderRadius.circular(30),child: Image.network(news.urlToImage,errorBuilder:(context, error, stackTrace) => const CupertinoActivityIndicator(),)),),
                   ),
                   Text(news.title),
                 ],
               ),
               subtitle: Text(news.description),
             //leading: Text('test2'),
        // trailing: Text('test3'),
             ),
           ),
         );
       }),
     ),
    );
  }
}
