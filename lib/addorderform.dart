import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'orderhistory.dart'; // Import OrderHistory page

class AddOrderForm extends StatefulWidget {
  @override
  _AddOrderFormState createState() => _AddOrderFormState();
}

class _AddOrderFormState extends State<AddOrderForm> {
  final TextEditingController _orderNameController = TextEditingController();
  final TextEditingController _orderDetailsController = TextEditingController();

  Future<void> _submitOrder() async {
    final String orderName = _orderNameController.text;
    final String orderDetails = _orderDetailsController.text;

    if (orderName.isEmpty || orderDetails.isEmpty) {
      // Show error message if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter order name and details')),
      );
      return;
    }

    try {
      // Save the order to Firebase Firestore
      await FirebaseFirestore.instance.collection('orders').add({
        'name': orderName,
        'order': orderName,
        'orderDetail': orderDetails,
        'createdAt': Timestamp.now(),
      });

      // Navigate to OrderHistory page after successful submission
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OrderHistory()),
      );
    } catch (e) {
      // Show error message if there is an issue with saving the order
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit order. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Order'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _orderNameController,
              decoration: InputDecoration(
                labelText: 'Customer Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _orderDetailsController,
              decoration: InputDecoration(
                labelText: 'Order Details',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitOrder, // Submit order and navigate
              child: Text('Submit Order'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
