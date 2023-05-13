import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDetailedScreen extends StatefulWidget {
  const HomeDetailedScreen({Key? key, required this.src, required this.content}) : super(key: key);
  final String src;
  final String content;

  @override
  State<HomeDetailedScreen> createState() => _HomeDetailedScreenState();
}

class _HomeDetailedScreenState extends State<HomeDetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Expanded(flex: 1,child: Hero(tag: widget.src ,child: ClipRRect(borderRadius: BorderRadius.circular(30),child: Image.network(widget.src,errorBuilder: (context,error,stackTrace)=>const CupertinoActivityIndicator(),)))),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(flex:2,child: SingleChildScrollView(child: Text(widget.content),)),
            )
          ],
        ),
      ),
    );
  }
}
