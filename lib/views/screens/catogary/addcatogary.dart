import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledocadmin/controllers/catogary/catogarycontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teledocadmin/model/catogary/catogary.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return 
 
       Center(
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
                  fixedSize:const Size(2000, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Add Category'),
              ),
              _buildImagePreview(controller),
              const SizedBox(height: 16.0),
              Expanded(
                child: _buildCategoryList(),
              ),
            ],
          ),
        ),
      );
   // );
  }

  Widget _buildImagePreview(CategoryController controller) {
    return controller.image != null
        ? Image.file(
            controller.image!,
            height: 200,
          )
        : const SizedBox();
  }

  Widget _buildCategoryList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('categories').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
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
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              const  Divider(
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
