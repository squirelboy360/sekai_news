// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sekai_news/screens/main_screens/detailed_screens/home/home_detailed_screen.dart';
import 'package:sekai_news/universal_elements/custom_bg_colors.dart';
import 'package:sekai_news/universal_elements/links.dart';

import '../../provider_classes/home_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
List<Home>_news=[];
class _HomeScreenState extends State<HomeScreen> {

Future<dynamic>fetchGeneralNews()async{
  final response= await http.get(Uri.parse(homeurl));

  if(response.statusCode==200){
    final data = jsonDecode(response.body);
    if(mounted){
      setState(() {
        _news=List.from(data['data']).map((e) => Home.fromJson(e)).toList();
      });
    }
  }else{
    throw Exception('error');
  }
}


@override
void initState() {
   fetchGeneralNews();
    super.initState();
  }

Future<void>_refresh()async{
  await fetchGeneralNews();
  setState(() {

  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
     body: NestedScrollView(
       headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
           title: Text('General News',style: GoogleFonts.albertSans(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white70)),
           expandedHeight: 210,
           flexibleSpace: FlexibleSpaceBar(
             background: Image.asset('assets/1.png',fit: BoxFit.cover,filterQuality: FilterQuality.high,colorBlendMode: BlendMode.colorBurn),
           ),
           floating: true,
           pinned: true,
           elevation: 0,
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
         ),
       ],
       body:_news.isEmpty ? const Center(
         child: CupertinoActivityIndicator(animating: true,),
       ): RefreshIndicator(
         triggerMode: RefreshIndicatorTriggerMode.anywhere,
         color: Colors.white,
         backgroundColor: Colors.blueAccent,
         onRefresh: _refresh,
         child: ListView.builder(addAutomaticKeepAlives: true,itemCount: _news.length,itemBuilder: (context,index){
         final news=_news[index];
         return Padding(
           padding: const EdgeInsets.all(0.0),
           child: InkWell(
             onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeDetailedScreen(content: news.content,src: news.urlToImage,title: news.title,publishedAt: news.publishedAt,author: news.author,)));
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
       )
     ),
    );
  }
}
