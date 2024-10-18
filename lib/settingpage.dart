import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            _buildSettingsSectionTitle('Account Settings'),
            _buildSettingsItem(
              icon: Icons.person,
              title: 'Profile',
              onTap: () {
                // Navigate to profile settings page
              },
            ),
            _buildSettingsItem(
              icon: Icons.lock,
              title: 'Change Password',
              onTap: () {
                // Navigate to change password page
              },
            ),
            _buildSettingsItem(
              icon: Icons.email,
              title: 'Email Preferences',
              onTap: () {
                // Navigate to email preferences
              },
            ),
            SizedBox(height: 20),
            _buildSettingsSectionTitle('Notifications'),
            _buildNotificationSettings(),
            SizedBox(height: 20),
            _buildSettingsSectionTitle('Theme'),
            _buildThemeSettings(),
            SizedBox(height: 20),
            _buildSettingsSectionTitle('Other'),
            _buildSettingsItem(
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () {
                // Navigate to help & support page
              },
            ),
            _buildSettingsItem(
              icon: Icons.info_outline,
              title: 'About Us',
              onTap: () {
                // Navigate to about page
              },
            ),
            _buildSettingsItem(
              icon: Icons.exit_to_app,
              title: 'Logout',
              onTap: () {
                // Implement logout functionality
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build settings sections
  Widget _buildSettingsSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  // Helper method to build individual settings items
  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.red),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: onTap,
    );
  }

  // Widget for notification settings with toggle switches
  Widget _buildNotificationSettings() {
    return Column(
      children: [
        SwitchListTile(
          activeColor: Colors.red,
          title: Text(
            'Receive Notifications',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          value: true, // Assume notifications are enabled
          onChanged: (bool value) {
            // Handle toggle switch logic
          },
        ),
        SwitchListTile(
          activeColor: Colors.red,
          title: Text(
            'Receive Promotional Emails',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          value: false, // Assume promo emails are disabled
          onChanged: (bool value) {
            // Handle toggle switch logic
          },
        ),
      ],
    );
  }

  // Widget for theme settings with radio buttons
  Widget _buildThemeSettings() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.brightness_4, color: Colors.red),
          title: Text(
            'Dark Mode',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          trailing: Switch(
            activeColor: Colors.red,
            value: true, // Assume dark mode is enabled
            onChanged: (bool value) {
              // Handle theme change logic
            },
          ),
        ),
        ListTile(
          leading: Icon(Icons.palette, color: Colors.red),
          title: Text(
            'App Theme Color',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
          onTap: () {
            // Navigate to theme color picker page
          },
        ),
      ],
    );
  }
}
