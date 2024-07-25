import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teledocadmin/controllers/catogary/catogarycontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teledocadmin/model/catogary/catogary.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: controller.catogarycontroller,
                  decoration: InputDecoration(
                    labelText: 'Category Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: const Icon(Icons.category),
                  ),
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    controller.pickImage();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.green), // Change the color here
                  ),
                  child: const Text('Pick Image'),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final name = controller.catogarycontroller.text.trim();
                    final image = controller.image;
                    if (image != null) {
                      final imageUrl = await controller.uploadImage(image);
                      if (imageUrl != null) {
                        controller.addCategory(name, imageUrl);
                        controller.addCategoryToFirebase(name, imageUrl);
                        controller.catogarycontroller.clear();
                      } else {
                        Get.snackbar("Error", "Failed to upload image",
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    } else {
                      Get.snackbar("Error", "Please pick an image",
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    elevation: 10.0,
                    fixedSize: Size(
                      constraints.maxWidth * 0.5,
                      50,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Add Category'),
                ),
                _buildImagePreview(controller),
                const SizedBox(height: 16.0),
                Expanded(
                  child: _buildCategoryList(controller),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImagePreview(CategoryController controller) {
    return controller.image != null
        ? Image.file(
            controller.image!,
            height: 200,
          )
        : const SizedBox();
  }

  Widget _buildCategoryList(CategoryController controller) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('categories').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: SizedBox(
            width: 50,  // Adjust the width as needed
            height: 50, // Adjust the height as needed
            child: const CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: 2,
            ),
          ),
        );
      }

        final List<DocumentSnapshot> documents = snapshot.data!.docs;

        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final category = Category.fromMap(
                documents[index].data() as Map<String, dynamic>);
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(category.name),
                  leading: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: Image.network(
                        category.image,
                        height: 100,
                      )),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 35,
                    width: 60,
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          showEditDialog(
                            context,
                            controller,
                            documents[index].id,
                            category.name,
                            category.image,
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            );
          },
        );
      },
    );
  }
}


Future<void> showEditDialog(
    BuildContext context, CategoryController controller, String docId, String currentName, String currentImageUrl) async {
  final TextEditingController nameController = TextEditingController(text: currentName);
  File? newImage;

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit Category'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Category Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  final pickedFile = await controller.picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    newImage = File(pickedFile.path);
                    controller.update();
                  }
                },
                child: const Text('Change Image'),
              ),
              const SizedBox(height: 16.0),
              if (newImage != null)
                Image.file(
                  newImage!,
                  height: 100,
                )
              else
                Image.network(
                  currentImageUrl,
                  height: 100,
                ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            child: const Text('Save'),
            onPressed: () {
              final newName = nameController.text.trim();
              if (newImage != null) {
                controller.updateCategoryImage(docId, newName, newImage!);
              } else {
                controller.updateCategory(docId, newName, currentImageUrl);
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
