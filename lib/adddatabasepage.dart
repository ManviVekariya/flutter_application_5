import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'admin.dart';

class FoodDatabasePage extends StatefulWidget {
  @override
  _FoodDatabasePageState createState() => _FoodDatabasePageState();
}

class _FoodDatabasePageState extends State<FoodDatabasePage> {
  final CollectionReference foodCollection =
      FirebaseFirestore.instance.collection('foodItems');

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _restaurantController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // Form key for validation

  // Method to add food item to Firestore
  Future<void> _addFoodItem() async {
    final String name = _nameController.text;
    final String restaurant = _restaurantController.text;
    final double? rating = double.tryParse(_ratingController.text);
    final String image = _imageController.text;

    if (_formKey.currentState!.validate()) {
      if (rating != null) {
        await foodCollection.add({
          'name': name,
          'restaurant': restaurant,
          'rating': rating,
          'image': image,
        });

        // Clear the text fields after adding
        _nameController.clear();
        _restaurantController.clear();
        _ratingController.clear();
        _imageController.clear();
      }
    }
  }

  // Method to delete food item from Firestore
  Future<void> _deleteFoodItem(String id) async {
    await foodCollection.doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Food Items'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _showAddFoodDialog(context);
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: foodCollection.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final foodItems = snapshot.data!.docs;

          return ListView.builder(
            itemCount: foodItems.length,
            itemBuilder: (context, index) {
              final item = foodItems[index];
              final data = item.data() as Map<String, dynamic>;

              return ListTile(
                leading: Image.network(data['image'],
                    width: 50, height: 50, fit: BoxFit.cover),
                title: Text(data['name']),
                subtitle: Text(
                    'Restaurant: ${data['restaurant']} | Rating: ${data['rating']}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _deleteFoodItem(item.id); // Delete item
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Show a dialog to add a new food item
  void _showAddFoodDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Food Item'),
          content: Form(
            key: _formKey, // Add form key for validation
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Food Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the food name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _restaurantController,
                  decoration: InputDecoration(labelText: 'Restaurant'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the restaurant name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _ratingController,
                  decoration: InputDecoration(labelText: 'Rating'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a rating';
                    }
                    final rating = double.tryParse(value);
                    if (rating == null || rating < 0 || rating > 5) {
                      return 'Please enter a valid rating between 0 and 5';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _imageController,
                  decoration: InputDecoration(labelText: 'Image URL'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an image URL';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addFoodItem();
                  Navigator.of(context).pop(); // Close the dialog after adding
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
