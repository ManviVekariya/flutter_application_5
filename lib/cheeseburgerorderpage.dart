import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'databasefood.dart'; // For Firebase connection

class FoodDetailPage extends StatefulWidget {
  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  double spiciness = 0.0;
  int portion = 2;
  final FirebaseFirestore firestore =
      FirebaseFirestore.instance; // Firestore instance

  // Function to handle ordering
  void orderNow() {
    firestore.collection('order1').add({
      'food_name': 'Cheeseburger from Wendy\'s Burger',
      'spiciness': spiciness,
      'portion': portion,
      'price': 300,
      'timestamp': FieldValue.serverTimestamp(),
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Order placed successfully!')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to place order: $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Cheeseburger from Wendy\'s Burger'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                'assets/jk.jpg', // Replace with actual image URL
                height: 200,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Cheeseburger from Wendy's Burger",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange),
                Text('4.9'),
                SizedBox(width: 10),
                Text('26 mins'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "The Cheeseburger from Wendy's Burger is a classic fast food burger "
              "that packs a punch of flavor in every bite. Made with a juicy beef "
              "patty cooked to perfection, it's topped with melted American cheese, "
              "crispy lettuce, ripe tomato, and crunchy pickles.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Spiciness'),
                Expanded(
                  child: Slider(
                    value: spiciness,
                    min: 0,
                    max: 10,
                    onChanged: (value) {
                      setState(() {
                        spiciness = value;
                      });
                    },
                  ),
                ),
                Text(spiciness.toStringAsFixed(1)),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Portion'),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (portion > 1) {
                          setState(() {
                            portion--;
                          });
                        }
                      },
                    ),
                    Text(portion.toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          portion++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₹300',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: orderNow,
                  child: Text('ORDER NOW'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
