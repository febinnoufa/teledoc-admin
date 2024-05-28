import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledocadmin/screens/settings/screen/addcatogary.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.green,
      context: context,
      builder: (context) {
        return Container(
          color: Color.fromARGB(255, 177, 231, 179),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.category_sharp),
                title: const Text('Add catogary'),
                onTap: () {
                  Get.to(CategoryPage());
                  // Handle the action here
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notifications'),
                onTap: () {
                  // Handle the action here
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // Handle the action here
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help & Feedback'),
                onTap: () {
                  // Handle the action here
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  // Handle the action here
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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
