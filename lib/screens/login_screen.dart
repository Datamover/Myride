import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String _error = "";

  void _login() async {
    final user = await _authService.signInWithEmail(_email.text.trim(), _password.text.trim());
    if (user != null) {
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      setState(() => _error = "Login failed. Try again.");
    }
  }

  void _signup() async {
    final user = await _authService.signUpWithEmail(_email.text.trim(), _password.text.trim());
    if (user != null) {
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      setState(() => _error = "Signup failed.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyRide Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _email, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: _password, obscureText: true, decoration: InputDecoration(labelText: "Password")),
            if (_error.isNotEmpty) Text(_error, style: TextStyle(color: Colors.red)),
            ElevatedButton(onPressed: _login, child: Text("Login")),
            TextButton(onPressed: _signup, child: Text("Don't have an account? Sign Up"))
          ],
        ),
      ),
    );
  }
}
