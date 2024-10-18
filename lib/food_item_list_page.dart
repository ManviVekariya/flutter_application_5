import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodItemListPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Items'),
        backgroundColor: Colors.redAccent,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('foodItems').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No food items found.'));
          }

          final foodItems = snapshot.data!.docs;

          return ListView.builder(
            itemCount: foodItems.length,
            itemBuilder: (context, index) {
              final item = foodItems[index].data() as Map<String, dynamic>;
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.network(item['image'],
                      width: 50, fit: BoxFit.cover),
                  title: Text(item['name']),
                  subtitle:
                      Text('${item['restaurant']} - Rating: ${item['rating']}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
