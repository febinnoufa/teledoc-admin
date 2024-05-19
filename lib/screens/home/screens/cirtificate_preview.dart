import 'package:flutter/material.dart';

class CirtificatePreviewPage extends StatelessWidget {
   CirtificatePreviewPage({super.key,required this.heading,required this.image});
  var heading;
  var image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:  Text("$heading",style: TextStyle(color: Colors.black),),
      ),
      body:  Center(
        child: Image.network(image),
      ),
    )
    );
  }
}