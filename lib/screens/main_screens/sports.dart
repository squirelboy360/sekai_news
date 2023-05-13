import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SportsScreen extends StatefulWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
