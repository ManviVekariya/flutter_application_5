import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BurgerDetailPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Burger Detail Page
class BurgerDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Pop the page off the navigation stack
          },
        ),
        backgroundColor: Colors.brown[50],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/jk.jpg', // Make sure the image is in the assets folder
                height: 200,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Cheeseburger from Wendy's Burger",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 18),
                SizedBox(width: 4),
                Text(
                  '4.9',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 10),
                Text(
                  '– 26 mins',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "The Cheeseburger from Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Spiciness',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Slider(
                    value: 1,
                    onChanged: (value) {},
                    min: 0,
                    max: 2,
                    divisions: 2,
                    label: 'Medium',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Portion',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {}, // Implement decrement logic
                      icon: Icon(Icons.remove),
                      color: Colors.red,
                    ),
                    Text(
                      '2',
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {}, // Implement increment logic
                      icon: Icon(Icons.add),
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  '₹100',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BurgerCustomizationPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown, // Button color
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    'ORDER NOW',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Burger Customization Page
class BurgerCustomizationPage extends StatefulWidget {
  @override
  _BurgerCustomizationPageState createState() =>
      _BurgerCustomizationPageState();
}

class _BurgerCustomizationPageState extends State<BurgerCustomizationPage> {
  int portion = 2;
  double spiciness = 1;
  List<String> selectedToppings = [];
  List<String> selectedSides = [];

  List<Map<String, String>> toppings = [
    {'name': 'Tomato', 'image': 'assets/tomato.jpg'},
    {'name': 'Onions', 'image': 'assets/onion.jpg'},
    {'name': 'Pickles', 'image': 'assets/pickle.jpg'},
    {'name': 'Bacon', 'image': 'assets/bacon.jpg'},
  ];

  List<Map<String, String>> sides = [
    {'name': 'Fries', 'image': 'https://via.placeholder.com/50'},
    {'name': 'Coleslaw', 'image': 'https://via.placeholder.com/50'},
    {'name': 'Salad', 'image': 'https://via.placeholder.com/50'},
    {'name': 'Onion Rings', 'image': 'https://via.placeholder.com/50'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/jk.jpg', // Ensure the image path is correct
                  height: 150,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Customize Your Burger to Your Tastes. Ultimate Experience",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Spiciness',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Slider(
                      value: spiciness,
                      onChanged: (value) {
                        setState(() {
                          spiciness = value;
                        });
                      },
                      min: 0,
                      max: 2,
                      divisions: 2,
                      label: spiciness == 0
                          ? 'Mild'
                          : spiciness == 1
                              ? 'Medium'
                              : 'Hot',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Portion',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (portion > 1) portion--;
                          });
                        },
                        icon: Icon(Icons.remove),
                        color: Colors.red,
                      ),
                      Text(
                        '$portion',
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            portion++;
                          });
                        },
                        icon: Icon(Icons.add),
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Toppings',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: toppings.map((topping) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedToppings.contains(topping['name'])) {
                          selectedToppings.remove(topping['name']);
                        } else {
                          selectedToppings.add(topping['name']!);
                        }
                      });
                    },
                    child: Container(
                      width: 80,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: selectedToppings.contains(topping['name'])
                            ? Colors.red[50]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selectedToppings.contains(topping['name'])
                              ? Colors.red
                              : Colors.transparent,
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            topping['image']!,
                            height: 40,
                          ),
                          SizedBox(height: 4),
                          Text(topping['name']!),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              Text(
                'Sides',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: sides.map((side) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedSides.contains(side['name'])) {
                          selectedSides.remove(side['name']);
                        } else {
                          selectedSides.add(side['name']!);
                        }
                      });
                    },
                    child: Container(
                      width: 80,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: selectedSides.contains(side['name'])
                            ? Colors.red[50]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selectedSides.contains(side['name'])
                              ? Colors.red
                              : Colors.transparent,
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            side['image']!,
                            height: 40,
                          ),
                          SizedBox(height: 4),
                          Text(side['name']!),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(
                        portion: portion,
                        spiciness: spiciness,
                        toppings: selectedToppings,
                        sides: selectedSides,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  'CONFIRM ORDER',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Payment Page
class PaymentPage extends StatelessWidget {
  final int portion;
  final double spiciness;
  final List<String> toppings;
  final List<String> sides;

  PaymentPage({
    required this.portion,
    required this.spiciness,
    required this.toppings,
    required this.sides,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text('Portion: $portion'),
            Text(
                'Spiciness: ${spiciness == 0 ? "Mild" : spiciness == 1 ? "Medium" : "Hot"}'),
            Text('Toppings: ${toppings.join(', ')}'),
            Text('Sides: ${sides.join(', ')}'),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Implement payment processing logic
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Payment Successful'),
                    content: Text('Your order has been placed!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close dialog
                          Navigator.pop(
                              context); // Go back to Burger Detail Page
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('PAY NOW'),
            ),
          ],
        ),
      ),
    );
  }
}
