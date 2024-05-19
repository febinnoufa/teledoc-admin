import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledocadmin/screens/home/screens/cirtificate_preview.dart';

// ignore: must_be_immutable
class SirtficatButtonWidget extends StatelessWidget {
   SirtficatButtonWidget({super.key,this.data,this.text});
  var text;
  var data;

  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(
      
                    onPressed: () {
                    
                      Get.to(  CirtificatePreviewPage(heading: text,image: data,))   ;                  
                    },
                    style: ElevatedButton.styleFrom(
                      // ignore: deprecated_member_use
                      primary: Color.fromARGB(255, 129, 223, 130), // Background color
                      // ignore: deprecated_member_use
                      onPrimary: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                        side: const BorderSide(
                            color: Color.fromARGB(255, 191, 213, 192),
                            width: 2), // Border color and width
                      ),
                    ),
                    child:  Text("$text",style: TextStyle(color: Colors.black),),
                  );
  }
}