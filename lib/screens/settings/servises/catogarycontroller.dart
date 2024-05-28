import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledocadmin/screens/settings/screen/addcatogary.dart';

class CategoryController extends GetxController {

    final FirebaseFirestore db = FirebaseFirestore.instance;
  // Observable list to hold categories
  final RxList<Category> categories = RxList<Category>([]);
  final catogarycontroller = TextEditingController(); // New for user input


  void addCategory(String name) {
    if (name.isEmpty) {
      Get.snackbar("Error", "Please enter a category name",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    categories.add(Category(name: name, id: ''));
    update(); // Notify UI about changes
  }


Future<void> addCategoryToFirebase(String name) async {
  if (name.isEmpty) {
    Get.snackbar("Error", "Please enter a category name",
        snackPosition: SnackPosition.BOTTOM);
    return;
  }

  // Generate a unique ID
  final String id = FirebaseFirestore.instance.collection('categories').doc().id;

  final category = Category(id: id, name: name);
  await db.collection("categories").doc(name).set(category.toMap());
  // Update UI after successful addition (optional)
  update();
}

}
