import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart'; 
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:teledocadmin/model/catogary/catogary.dart';



class CategoryController extends GetxController {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final RxList<Category> categories = RxList<Category>([]);
  final catogarycontroller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
 late File? _image = null;
 // Initialize with null

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      update(); // Notify UI about changes
    } else {
      print('No image selected.');
    }
  }

  void addCategory(String name, String image) {
    if (name.isEmpty) {
      Get.snackbar("Error", "Please enter a category name",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    categories.add(Category(name: name, id: '', image: image));
    update(); // Notify UI about changes
  }

  Future<void> addCategoryToFirebase(String name, String imageUrl) async {
    if (name.isEmpty || imageUrl.isEmpty) {
      Get.snackbar("Error", "Please enter a category name",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

  
    final String id = db.collection('categories').doc().id;

    final category = Category(id: id, name: name, image: imageUrl);
    await db.collection("categories").doc(name).set(category.toMap());
    
    update();
  }

  Future<String?> uploadImage(File image) async {
    try {
      String fileName = basename(image.path);
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('uploads/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      return null;
    }
  }

  File? get image => _image;
}
