import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TechScreen extends StatefulWidget {
  const TechScreen({Key? key}) : super(key: key);

  @override
  State<TechScreen> createState() => _TechScreenState();
}

class _TechScreenState extends State<TechScreen> {
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
        body: ListView.builder(itemBuilder: (context,index){
          return const ListTile(
            title: Column(
              children: [
                Text('data'),
              ],
            ),
            subtitle: Text('test1'),
            leading: Text('test2'),
            trailing: Text('test3'),
          );
        }),
      ),
    );
  }
}
