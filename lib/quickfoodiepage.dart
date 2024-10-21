import 'package:flutter/material.dart';
import 'database63.dart'; // Import the database service

void main() {
  runApp(QuickFoodieApp());
}

class QuickFoodieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuickFoodiePage(),
    );
  }
}

class QuickFoodiePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Quick Foodie',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/burger.jpg', // Local asset
              height: 100,
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Food Name',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Food Description',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Image URL',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add the new food item to Firestore
                DatabaseService().addFoodItem(
                  nameController.text,
                  descriptionController.text,
                  imageUrlController.text,
                );
                nameController.clear();
                descriptionController.clear();
                imageUrlController.clear();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(
                'Add Item',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: StreamBuilder<List<FoodItem>>(
                stream: DatabaseService().getFoodItems(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final foodItems = snapshot.data!;
                  return GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: foodItems.map((food) {
                      return FoodCard(
                        imageUrl: food.imageUrl,
                        name: food.name,
                        description: food.description,
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class FoodCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;

  FoodCard({
    required this.imageUrl,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Image.network(
            imageUrl, // Load image from network (Firestore URL)
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(description),
        ],
      ),
    );
  }
}
