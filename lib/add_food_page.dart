import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddFoodPage extends StatefulWidget {
  @override
  _AddFoodPageState createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _restaurantController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _addFoodItem() async {
    if (_formKey.currentState!.validate()) {
      await _firestore.collection('foodItems').add({
        'name': _nameController.text,
        'restaurant': _restaurantController.text,
        'rating': double.tryParse(_ratingController.text) ?? 0.0,
        'image': _imageController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Food item added successfully!')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Food Item'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Food Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter food name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _restaurantController,
                decoration: InputDecoration(labelText: 'Restaurant'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter restaurant name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ratingController,
                decoration: InputDecoration(labelText: 'Rating (0-5)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter rating';
                  }
                  final rating = double.tryParse(value);
                  if (rating == null || rating < 0 || rating > 5) {
                    return 'Enter a valid rating between 0 and 5';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter image URL';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addFoodItem,
                child: Text('Add Food Item'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
