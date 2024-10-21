import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FoodDetailPage extends StatefulWidget {
  final String foodId; // Pass the food item's ID from the home page

  FoodDetailPage({required this.foodId});

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  late DocumentSnapshot foodItem; // To store the fetched food item

  @override
  void initState() {
    super.initState();
    fetchFoodItem();
  }

  void fetchFoodItem() async {
    foodItem = await FirebaseFirestore.instance
        .collection('foodLove')
        .doc(widget.foodId)
        .get();
    setState(() {}); // Trigger UI update
  }

  @override
  Widget build(BuildContext context) {
    if (foodItem == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Loading...'),
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Use the fetched `foodItem` in your UI
    return Scaffold(
      appBar: AppBar(
        title: Text(foodItem['name'] ?? 'Food Detail'),
      ),
      body: Column(
        children: [
          Image.network(foodItem['image'] ?? 'assets/default.jpg'),
          Text(foodItem['name']),
          Text('Price: ₹${foodItem['price']}'),
          // Add the rest of the UI (sliders, order button, etc.)
        ],
      ),
    );
  }
}
