import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference foodCollection =
      FirebaseFirestore.instance.collection('food_items');

  // Fetch all food items from Firestore
  Future<List<Map<String, dynamic>>> getFoodItems() async {
    try {
      QuerySnapshot snapshot = await foodCollection.get();
      List<Map<String, dynamic>> foodItems = snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'name': doc['name'],
          'restaurant': doc['restaurant'],
          'rating': doc['rating'],
        };
      }).toList();
      return foodItems;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  // Add new food item
  Future<void> addFoodItem(
      String name, String restaurant, double rating) async {
    try {
      await foodCollection.add({
        'name': name,
        'restaurant': restaurant,
        'rating': rating,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // Update food item
  Future<void> updateFoodItem(
      String id, String name, String restaurant, double rating) async {
    try {
      await foodCollection.doc(id).update({
        'name': name,
        'restaurant': restaurant,
        'rating': rating,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // Delete food item
  Future<void> deleteFoodItem(String id) async {
    try {
      await foodCollection.doc(id).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
