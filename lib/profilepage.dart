import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            _buildProfileHeader(screenWidth),
            SizedBox(height: 30),
            _buildProfileDetails(screenWidth),
            SizedBox(height: 30),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  // Profile Header Section
  Widget _buildProfileHeader(double screenWidth) {
    return Column(
      children: [
        // Profile Picture with edit icon
        Stack(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage:
                  AssetImage('assets/profile.jpg'), // Placeholder image
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  // Action to edit profile picture
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: screenWidth * 0.06,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        // User Name
        Text(
          "John Doe",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.06,
          ),
        ),
        SizedBox(height: 5),
        // Email
        Text(
          "johndoe@gmail.com",
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // Profile Details Section (Phone, Address, etc.)
  Widget _buildProfileDetails(double screenWidth) {
    return Column(
      children: [
        _buildDetailCard(
          icon: Icons.phone,
          label: "Phone Number",
          value: "+1 234 567 890",
          onTap: () {
            // Action to edit phone number
          },
          screenWidth: screenWidth,
        ),
        SizedBox(height: 10),
        _buildDetailCard(
          icon: Icons.location_on,
          label: "Address",
          value: "123, Sunset Blvd, LA",
          onTap: () {
            // Action to edit address
          },
          screenWidth: screenWidth,
        ),
        SizedBox(height: 10),
        _buildDetailCard(
          icon: Icons.lock,
          label: "Change Password",
          value: "••••••••",
          onTap: () {
            // Action to change password
          },
          screenWidth: screenWidth,
        ),
      ],
    );
  }

  // Action buttons like Edit Profile, Settings, Logout
  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        _buildActionButton(
          icon: Icons.settings,
          label: "Settings",
          onTap: () {
            // Navigate to Settings page
          },
        ),
        SizedBox(height: 10),
        _buildActionButton(
          icon: Icons.logout,
          label: "Logout",
          onTap: () {
            // Action to log out
          },
        ),
      ],
    );
  }

  // Profile Detail Card widget
  Widget _buildDetailCard({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
    required double screenWidth,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.red, size: screenWidth * 0.07),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.edit, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  // Action Button widget
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.red, size: 30),
              SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
