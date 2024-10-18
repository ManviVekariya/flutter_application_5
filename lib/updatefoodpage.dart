import 'package:flutter/material.dart';

class UpdateFoodPage extends StatelessWidget {
  final String foodId;

  UpdateFoodPage({required this.foodId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Food')),
      body: Center(child: Text('Update food details for ID: $foodId')),
    );
  }
}
