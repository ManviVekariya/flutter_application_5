import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'otpverification.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _resetPassword() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text.trim());
      _showMessage('Password reset email sent!');
      // Navigate to OTP verification page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              OTPVerificationPage(email: _emailController.text.trim()),
        ),
      );
    } on FirebaseAuthException catch (e) {
      _showMessage('Error: ${e.message}');
    } catch (e) {
      _showMessage('An unexpected error occurred.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your email to receive a password reset link.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _resetPassword,
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Send Email'),
            ),
          ],
        ),
      ),
    );
  }
}
