import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sekai_news/screens/main_screens/detailed_screens/tech/tech_detailed_screen.dart';
import '../../provider_classes/tech_class.dart';

class TechScreen extends StatefulWidget {
  const TechScreen({Key? key}) : super(key: key);

  @override
  State<TechScreen> createState() => _TechScreenState();
}
List<Tech>_tech=[];
bool _mounted = false;
class _TechScreenState extends State<TechScreen> {

  final url = 'https://inshorts.deta.dev/news?category=technology';
  Future<void>fetchTech()async{
    final response = await http.get(Uri.parse(url));

    if(response.statusCode==200){
      final data = jsonDecode(response.body);
      if(mounted){
        setState(() {
          _tech = List.from(data['data']).map((e) => Tech.fromJson(e)).toList();
        });
      }
    }else{
      throw Exception('error');
    }
  }

  @override
  void initState() {
    _mounted = true;
    fetchTech();
    super.initState();
  }
@override
void dispose() {
    _mounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text('Tech News',style: GoogleFonts.albertSans(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black54)),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/4.png',fit: BoxFit.fitWidth,filterQuality: FilterQuality.high,colorBlendMode: BlendMode.colorBurn),
            ),
            floating: true,
            pinned: true,
            elevation: 0,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          ),
        ],
        body:_tech.isEmpty ? const Center(child: CupertinoActivityIndicator(),)
            : ListView.builder(addAutomaticKeepAlives: true,itemCount: _tech.length,itemBuilder: (context,index){
          final tech=_tech[index];
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: InkWell(
              onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TechDetailedScreen(imageUrl: tech.imageUrl, content: tech.content, title: tech.title, date: tech.date, author: tech.author)));
              },
              child: ListTile(
                title: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(tag: tech.imageUrl,child: ClipRRect(borderRadius: BorderRadius.circular(30),child: Image.network(tech.imageUrl,errorBuilder:(context, error, stackTrace) => const CupertinoActivityIndicator(),)),),
                    ),
                    Text(tech.title),
                  ],
                ),
                subtitle: Text('${tech.date}''-''${tech.time}'),
                //leading: Text('test2'),
                // trailing: Text('test3'),
              ),
            ),
          );
        })
      ),
    );
  }
}
