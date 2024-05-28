import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledocadmin/screens/settings/servises/catogarycontroller.dart';




class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Category ',style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Text field for category name
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
              // Add button with onPressed calling controller method
              ElevatedButton(
                onPressed: () {
                  final name =  controller.catogarycontroller.text.trim(); // Get trimmed name
                  controller.addCategory(name);
                  controller.addCategoryToFirebase(name);
                   controller.catogarycontroller.clear(); // Clear text field after adding
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue[600],
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Add Category'),
              ),
              // Display existing categories
              Expanded(
                child: Obx(() => ListView.builder(
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    final category = controller.categories[index];
                    return ListTile(
                      title: Text(category.name),
                      leading: const Icon(Icons.category),
                    );
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});

  // Convert to Map for Firestore storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Create from Map (optional for reading from Firestore)
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }
}



