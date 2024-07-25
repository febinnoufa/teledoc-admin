import 'package:flutter/material.dart';
import 'package:teledocadmin/views/widgets/Home/count_doct_widget.dart';
import 'package:teledocadmin/views/widgets/Home/count_patiant_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "TELEDOC",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
           
            return const Column(
              children: [
                SizedBox(height: 90),
                DoctorCountWidget(),
                SizedBox(height: 90),
                PatiuntsCountWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}
