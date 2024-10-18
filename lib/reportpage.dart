import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reports",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOverviewCards(screenWidth),
            SizedBox(height: 30),
            Text(
              "Sales Analytics",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildPlaceholderText("No Sales Chart Available"),
            SizedBox(height: 30),
            Text(
              "Order Statistics",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildPlaceholderText("No Order Statistics Available"),
            SizedBox(height: 30),
            _buildDetailButton(),
          ],
        ),
      ),
    );
  }

  // Function to create overview cards
  Widget _buildOverviewCards(double screenWidth) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildReportCard(
            screenWidth: screenWidth * 0.9, // Take 90% of each card width
            title: "Total Sales",
            value: "\$12,345",
            icon: Icons.attach_money,
            iconColor: Colors.green,
          ),
          SizedBox(width: 10), // Add space between cards
          _buildReportCard(
            screenWidth: screenWidth * 0.9,
            title: "Orders Processed",
            value: "124",
            icon: Icons.shopping_cart,
            iconColor: Colors.orange,
          ),
          SizedBox(width: 10),
          _buildReportCard(
            screenWidth: screenWidth * 0.9,
            title: "Total Users",
            value: "1,024",
            icon: Icons.person,
            iconColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  // Function to create each overview card
  Widget _buildReportCard({
    required double screenWidth,
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      width: screenWidth,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    size: screenWidth *
                        0.1, // Adjust icon size based on screen width
                    color: iconColor,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                value,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Placeholder for charts (used to replace graphs)
  Widget _buildPlaceholderText(String text) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  // Detailed report button
  Widget _buildDetailButton() {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          // Navigate to detailed report page
        },
        child: Text(
          "View Detailed Report",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
