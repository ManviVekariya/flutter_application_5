import 'package:flutter/material.dart';
import 'package:flutter_application_5/addorderform.dart';
import 'package:flutter_application_5/loginpage.dart';
import 'package:flutter_application_5/orderhistory.dart';
import 'package:flutter_application_5/orderpage.dart'; // Import OrdersPage
import 'package:flutter_application_5/quickfoodiepage.dart';
import 'package:flutter_application_5/reportpage.dart';
import 'package:flutter_application_5/settingpage.dart';
import 'package:flutter_application_5/userpage.dart';
import 'foodhomepage.dart'; // Import QuickFoodiePage

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Dashboard',
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Manage your restaurant',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: screenWidth > 600 ? 3 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildAdminCard(
                    icon: Icons.fastfood,
                    label: 'Manage Food Items',
                    onTap: () {
                      // Navigate to the QuickFoodiePage when tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuickFoodiePage(),
                        ),
                      );
                    },
                    screenWidth: screenWidth,
                  ),
                  _buildAdminCard(
                    icon: Icons.receipt_long,
                    label: 'Orders',
                    onTap: () {
                      // Navigate to OrdersPage when tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddOrderForm(),
                        ),
                      );
                    },
                    screenWidth: screenWidth,
                  ),
                  _buildAdminCard(
                    icon: Icons.analytics,
                    label: 'Reports',
                    onTap: () {
                      // Navigate to reports page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReportPage(),
                        ),
                      );
                    },
                    screenWidth: screenWidth,
                  ),
                  _buildAdminCard(
                    icon: Icons.settings,
                    label: 'Settings',
                    onTap: () {
                      // Navigate to settings page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsPage(),
                        ),
                      );
                    },
                    screenWidth: screenWidth,
                  ),
                  _buildAdminCard(
                    icon: Icons.logout,
                    label: 'Logout',
                    onTap: () {},
                    screenWidth: screenWidth,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required double screenWidth,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: screenWidth * 0.12,
                color: Colors.red,
              ),
              SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.045,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
