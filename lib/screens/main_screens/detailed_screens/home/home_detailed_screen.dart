import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sekai_news/screens/main_screens/detailed_screens/home/custom_font_text_buttons.dart';

class HomeDetailedScreen extends StatefulWidget {
  const HomeDetailedScreen({Key? key, required this.src, required this.content, required this.title, required this.publishedAt, required this.author}) : super(key: key);
  final String src;
  final String content;
  final String title;
  final String publishedAt;
  final String author;

  @override
  State<HomeDetailedScreen> createState() => _HomeDetailedScreenState();
}

class _HomeDetailedScreenState extends State<HomeDetailedScreen> {

 double fontSize = 14;

  @override
  void fontSizeIncreaser(){
    setState(() {
      fontSize++;
    });
  }

 @override
 void fontSizeDecreaser(){
   setState(() {
     fontSize--;
   });
 }



 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
      ),
      //backgroundColor: Colors.transparent,
    body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Hero(tag: widget.src ,child: ClipRRect(borderRadius: BorderRadius.circular(30),child: Image.network(widget.src,errorBuilder: (context,error,stackTrace)=>const CupertinoActivityIndicator(),))),
        ),
        const SizedBox(height: 10,),
        CustomFontTextButton(content: widget.content,fontSizeIncreaser: fontSizeIncreaser,fontSizeDecreaser: fontSizeDecreaser,),
        const SizedBox(height: 10,),
        Card(
          elevation: 0,
          color: Colors.white70,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: ListTile(
            title: Text(widget.title,style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold),),
            subtitle: Column(
              children: [
                SingleChildScrollView(scrollDirection: Axis.vertical,child: Text(widget.content,style: GoogleFonts.poppins(fontSize: fontSize),)),
                const SizedBox(height: 10,),
                Text('Author: ${widget.author}',style: GoogleFonts.alegreya(fontSize: 20,fontWeight: FontWeight.bold),),
                Padding(padding: const EdgeInsets.all(8),child: Text(widget.publishedAt))
              ],
            ),
            //trailing: ,

          )
        ),
      ],
    ),
      );
  }
}
