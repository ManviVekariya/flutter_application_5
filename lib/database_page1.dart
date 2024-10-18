import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_5/updatefoodpage.dart';
import 'updatefoodpage.dart';

class DatabasePage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Database'),
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
              final foodItemDoc = foodItems[index];
              final item = foodItemDoc.data() as Map<String, dynamic>;
              final foodId = foodItemDoc.id; // Fetch the document ID

              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.network(
                    item['image'] ??
                        'https://via.placeholder.com/150', // Placeholder
                    width: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.image_not_supported,
                          size: 50); // Fallback icon
                    },
                  ),
                  title: Text(item['name']),
                  subtitle:
                      Text('${item['restaurant']} - Rating: ${item['rating']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  UpdateFoodPage(foodId: foodId),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _deleteFoodItem(context, foodId); // Pass context here
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _deleteFoodItem(BuildContext context, String foodId) async {
    await _firestore.collection('foodItems').doc(foodId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Food item deleted successfully!')),
    );
  }
}
