import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teledocadmin/const/const.dart';
import 'package:teledocadmin/views/screens/settings/settings.dart';
import 'package:teledocadmin/controllers/Auth/auth_controller.dart';
import 'package:teledocadmin/views/screens/applications/applications.dart';
import 'package:teledocadmin/views/screens/home/home_screen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class BotomNavigationBar extends StatefulWidget {
  const BotomNavigationBar({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BotomNavigationBar> {

  final AuthController loginController = Get.put(AuthController());
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.grey,
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: <Widget>[
              const HomeScreen(),
             
              const DoctorApplications(),
           
       
              SettingsPage(),
            ],
          ),
          bottomNavigationBar: WaterDropNavBar(
           // backgroundColor: Colors.black,
            waterDropColor: Colors.green,
            inactiveIconColor: Colors.black,
            onItemSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
              pageController.animateToPage(selectedIndex,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutQuad);
            },
            selectedIndex: selectedIndex,
            barItems: <BarItem>[
              BarItem(
                filledIcon: Icons.home_filled,
                outlinedIcon: Icons.home_outlined,
              ),
              BarItem(
                  filledIcon: Icons.local_hospital,
                  outlinedIcon: Icons.local_hospital_outlined),
              // BarItem(
              //   filledIcon: Icons.notification_important,
              //   outlinedIcon: Icons.notification_important_outlined,
              // ),
              BarItem(
                filledIcon: Icons.grid_view_rounded,
                outlinedIcon: Icons.grid_view_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
