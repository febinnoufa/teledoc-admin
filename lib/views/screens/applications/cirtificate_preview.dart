import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CirtificatePreviewPage extends StatelessWidget {
   CirtificatePreviewPage({super.key,required this.heading,required this.image});
  // ignore: prefer_typing_uninitialized_variables
  var heading;
  // ignore: prefer_typing_uninitialized_variables
  var image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:  Text("$heading",style: const TextStyle(color: Colors.black),),
      ),
      body:  Center(
        child: Image.network(image),
      ),
    )
    );
  }
}