import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledocadmin/controllers/Auth/auth_controller.dart';
import 'package:teledocadmin/views/screens/catogary/addcatogary.dart';

class SettingsPage extends StatelessWidget {
   SettingsPage({super.key});

  final AuthController cntr= Get.put(AuthController());
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.green,
      context: context,
      builder: (context) {
        return Container(
          color: const Color.fromARGB(255, 177, 231, 179),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
          
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
            
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help & Feedback'),
                onTap: () {
                
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  cntr.logout();

            
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _showModalBottomSheet(context);
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )
        ],
      ),
      body:const CategoryPage()
    );
  }
}
