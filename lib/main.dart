import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledocadmin/views/screens/splash/ssplash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:teledocadmin/controllers/applicaton/application_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {    
   
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: BindingsBuilder(() {
          Get.put(ApplicationController());
        }),
        home: const SplashPage());
  }
}
