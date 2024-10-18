import 'package:flutter/material.dart';
import 'package:flutter_application_5/profilepage.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
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
            _buildProfileImage(),
            SizedBox(height: 20),
            _buildUserInfo(screenWidth, context),
            SizedBox(height: 30),
            _buildUserActions(screenWidth, context),
          ],
        ),
      ),
    );
  }

  
  Widget _buildProfileImage() {
    return CircleAvatar(
      radius: 70,
      backgroundImage: AssetImage('assets/profile.jpg'), 
      backgroundColor: Colors.grey[200],
    );
  }

  
  Widget _buildUserInfo(double screenWidth, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "John Doe", 
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "johndoe@gmail.com", 
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "+1 234 567 890", 
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildUserActions(double screenWidth, BuildContext context) {
    return Column(
      children: [
        _buildActionButton(
          icon: Icons.edit,
          label: "Edit Profile",
          onTap: () {
          
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProfilePage(),
              ),
            );
          },
          screenWidth: screenWidth,
        ),
        SizedBox(height: 10),
        _buildActionButton(
          icon: Icons.lock,
          label: "Change Password",
          onTap: () {
        
          },
          screenWidth: screenWidth,
        ),
        SizedBox(height: 10),
        _buildActionButton(
          icon: Icons.logout,
          label: "Logout",
          onTap: () {
            
          },
          screenWidth: screenWidth,
        ),
      ],
    );
  }

  
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required double screenWidth,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 3,
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.red, size: screenWidth * 0.06),
              SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
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
}
