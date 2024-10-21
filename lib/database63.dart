import 'package:cloud_firestore/cloud_firestore.dart';

class FoodItem {
  final String name;
  final String description;
  final String imageUrl;

  FoodItem({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class DatabaseService {
  final CollectionReference foodCollection =
      FirebaseFirestore.instance.collection('foodLove');

  // Method to add food item to Firestore
  Future<bool> addFoodItem(
      String name, String description, String imageUrl) async {
    try {
      await foodCollection.add({
        'name': name,
        'description': description,
        'image': imageUrl,
      });
      return true;
    } catch (e) {
      print('Failed to add food item: $e');
      return false;
    }
  }

  // Method to retrieve food items from Firestore
  Stream<List<FoodItem>> getFoodItems() {
    return foodCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return FoodItem(
          name: data['name'],
          description: data['description'],
          imageUrl: data['image'],
        );
      }).toList();
    });
  }
}
