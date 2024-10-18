import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'adminloginpage.dart'; // Ensure AdminLoginPage is imported

class FoodHomePage extends StatefulWidget {
  @override
  _FoodHomePageState createState() => _FoodHomePageState();
}

class _FoodHomePageState extends State<FoodHomePage> {
  final CollectionReference foodCollection =
      FirebaseFirestore.instance.collection('foodItems');

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Foodgo'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'Order your favourite food!',
              style: TextStyle(fontSize: screenWidth * 0.045),
            ),
            SizedBox(height: screenHeight * 0.02),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: foodCollection.snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final foodItems = snapshot.data!.docs;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: screenWidth < 600 ? 2 : 3,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: screenWidth * 0.03,
                      mainAxisSpacing: screenHeight * 0.02,
                    ),
                    itemCount: foodItems.length,
                    itemBuilder: (context, index) {
                      final item =
                          foodItems[index].data() as Map<String, dynamic>;
                      return Card(
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.network(
                                item['image'], // Use Firebase image URL
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[200],
                                    child: Center(
                                      child: Text('Image not available'),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.04),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                item['restaurant'],
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: screenWidth * 0.035),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Rating: ${item['rating']}',
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: screenWidth * 0.035),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.redAccent),
            accountName: Text(
              'John Doe',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: screenWidth * 0.05),
            ),
            accountEmail: Text('john.doe@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined, color: Colors.redAccent),
            title: Text('Home', style: TextStyle(fontSize: screenWidth * 0.04)),
            onTap: () {
              Navigator.pop(context); // Close drawer and stay on the same page
            },
          ),
          ListTile(
            leading: Icon(Icons.admin_panel_settings, color: Colors.redAccent),
            title:
                Text('Admin', style: TextStyle(fontSize: screenWidth * 0.04)),
            onTap: () {
              // Navigate to AdminPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminLoginPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined, color: Colors.redAccent),
            title:
                Text('Logout', style: TextStyle(fontSize: screenWidth * 0.04)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
