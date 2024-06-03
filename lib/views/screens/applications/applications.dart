import 'package:flutter/material.dart';
import 'package:teledocadmin/views/widgets/application/application_widget.dart';

class DoctorApplications extends StatelessWidget {
  const DoctorApplications({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("APPLICATIONS",style: TextStyle(color: Colors.black),),centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,

        ),
        body:  Column(
          children: [
            
            ApplicationWidget()
          ],
        ),
        
      ),
    );
  }
}