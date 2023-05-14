import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sekai_news/screens/main_screens/detailed_screens/business/business_detailed_screen.dart';

import '../../provider_classes/business_class.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

List<Business>_business = [];
bool _mounted = false;

const url = 'https://inshorts.deta.dev/news?category=business';

class _BusinessScreenState extends State<BusinessScreen> {
  Future<void>fetchBusiness()async{
    final response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      final data = jsonDecode(response.body);
      if(_mounted){
        setState(() {
          _business = List.from(data['data']).map((e) => Business.fromJson(e)).toList();
        });
      }
    }else{
      throw Exception('error');
    }
  }

  @override
  void initState() {
    _mounted = true;
   fetchBusiness();
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
              title: Text('Business News',style: GoogleFonts.albertSans(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black54)),
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assets/2.png',fit: BoxFit.fitWidth,filterQuality: FilterQuality.high,colorBlendMode: BlendMode.colorBurn),
              ),
              floating: true,
              pinned: true,
              elevation: 0,
              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ],
          body:_business.isEmpty ? const Center(child: CupertinoActivityIndicator(),)
              :  ListView.builder(addAutomaticKeepAlives: true,itemCount: _business.length,itemBuilder: (context,index){
            final business=_business[index];
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BusinessDetailedScreen(imageUrl: business.imageUrl, content: business.content, title: business.title, date: business.date, author: business.author)));
                },
                child: ListTile(
                  title: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Hero(tag: business.imageUrl,child: ClipRRect(borderRadius: BorderRadius.circular(30),child: Image.network(business.imageUrl,errorBuilder:(context, error, stackTrace) => const CupertinoActivityIndicator(),)),),
                      ),
                      Text(business.title),
                    ],
                  ),
                  subtitle: Text('${business.date}''-''${business.time}'),
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
