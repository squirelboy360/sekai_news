import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomFontTextButton extends StatelessWidget {
  const CustomFontTextButton({Key? key, required this.content, required this.fontSizeIncreaser, required this.fontSizeDecreaser}) : super(key: key);
  final String content;
  final Function() fontSizeIncreaser;
  final Function() fontSizeDecreaser;
  
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: 200,
        //height: 50,
        decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(50)
        ),
        child: Column(
          children: [
            Text('Increase fontSize & copy text',style: GoogleFonts.openSans(color: Colors.black38),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(onPressed:fontSizeIncreaser , child: const Icon(Icons.add,color: Colors.blue,)),
                OutlinedButton(onPressed: (){
                  fontSizeDecreaser;
                }, child: const Icon(Icons.exposure_minus_1,color: Colors.deepOrange,)),
                OutlinedButton(onPressed: (){
                  Clipboard.setData(ClipboardData(text: content ));
                }, child: const Icon(Icons.copy_all_rounded,color: CupertinoColors.link,))
              ],),
          ],
        ),
      ),
    );
  }
}
