import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sekai_news/screens/main_screens/detailed_screens/sports/sports_detailed_screen.dart';
import 'package:sekai_news/universal_elements/custom_bg_colors.dart';
import 'package:sekai_news/universal_elements/links.dart';

import '../../provider_classes/sports_class.dart';
import 'package:http/http.dart' as http;

class SportsScreen extends StatefulWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}
List<Sports>_sports=[];
class _SportsScreenState extends State<SportsScreen> {

  Future<void>fetchSports()async{
    final response = await http.get(Uri.parse(sportsUrl));
    if (response.statusCode==200){
      final data = jsonDecode(response.body);
      if(mounted){
        setState(() {
          _sports=List.from(data['data']).map((e) => Sports.fromJson(e)).toList();
        });
      }
    }else{
      throw Exception('error');
    }
  }

  Future<void>_refresh()async{
    await fetchSports();
    setState(() {

    });
  }

  @override
  void initState() {
    fetchSports();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text('Sports News',style: GoogleFonts.albertSans(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black54)),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/3.png',fit: BoxFit.fitWidth,filterQuality: FilterQuality.high,colorBlendMode: BlendMode.colorBurn),
            ),
            floating: true,
            pinned: true,
            elevation: 0,
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ],
        body:_sports.isEmpty ? const Center(child: CupertinoActivityIndicator(),)
            :  RefreshIndicator(
          onRefresh: _refresh,
              backgroundColor: Colors.green,
              color: Colors.white,
              child: ListView.builder(addAutomaticKeepAlives: true,itemCount: _sports.length,itemBuilder: (context,index){
          final sports=_sports[index];
          return Padding(
              padding: const EdgeInsets.all(0.0),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SportDetailedScreen(imageUrl: sports.imageUrl, content: sports.content, title: sports.title, date: sports.date, author: sports.author)));
                },
                child: ListTile(
                  title: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Hero(tag: sports.imageUrl,child: ClipRRect(borderRadius: BorderRadius.circular(30),child: Image.network(sports.imageUrl,errorBuilder:(context, error, stackTrace) => const CupertinoActivityIndicator(),)),),
                      ),
                      Text(sports.title),
                    ],
                  ),
                  subtitle: Text('${sports.date}''-''${sports.time}'),
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
