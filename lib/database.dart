import 'package:cloud_firestore/cloud_firestore.dart';
hhh
class DatabaseService {
  // Firestore instance
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Collection reference
  final String collectionName = 'orders';

  // Add order to Firestore
  Future<void> addOrder(String name, String order, String orderDetail) async {
    try {
      await _db.collection(collectionName).add({
        'name': name,
        'order': order,
        'orderDetail': orderDetail,
        'createdAt': FieldValue.serverTimestamp(),
      });
      print('Order added successfully!');
    } catch (e) {
      print('Error adding order: $e');
      throw e;
    }
  }

  // Fetch all orders from Firestore
  Stream<QuerySnapshot> getOrders() {
    return _db
        .collection(collectionName)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  signUpWithEmailAndPassword(String trim, String trim2) {}
}
