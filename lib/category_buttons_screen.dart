import 'package:flutter/material.dart';
import 'video_screen.dart';

class CategoryButtonsScreen extends StatelessWidget {
  const CategoryButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB2DFDB),
      appBar: AppBar(
        title: const Text('ISL Categories'),
        centerTitle: true,
        backgroundColor: const Color(0xFF00796B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCategoryButton(context, "Animals"),
            const SizedBox(height: 16),
            buildCategoryButton(context, "Vegetables"),
            const SizedBox(height: 16),
            buildCategoryButton(context, "Feelings"),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryButton(BuildContext context, String label) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal.shade700,
          padding: const EdgeInsets.symmetric(vertical: 20),
          textStyle: const TextStyle(fontSize: 18),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SubcategoryScreen(categoryName: label),
            ),
          );
        },
        child: Text(label),
      ),
    );
  }
}

class SubcategoryScreen extends StatelessWidget {
  final String categoryName;

  const SubcategoryScreen({super.key, required this.categoryName});

  List<String> getItemsForCategory() {
    switch (categoryName) {
      case "Animals":
        return ["Bear", "Crocodile", "Deer", "Elephant", "Giraffe", "Lion"];
      case "Vegetables":
        return ["Brinjal", "Cabbage", "Carrot", "Cauliflower", "Onion", "Radish"];
      case "Feelings":
        return ["Fever", "Hello", "Hug", "Injury", "Myabe", "Thank you"];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = getItemsForCategory();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: Colors.teal.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.all(16),
                textStyle: const TextStyle(fontSize: 16),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VideoScreen(label: item),
                  ),
                );
              },
              child: Text(item),
            );
          },
        ),
      ),
    );
  }
}
