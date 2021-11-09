import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestLogin extends StatelessWidget {
  const TestLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _fullName = "";
    String _email = "";
    String _password = "";

    _registerUser() async {
      // Call the user's CollectionReference to add a new user
      await FirebaseFirestore.instance.collection('testUser').doc().set({
        'name': _fullName,
        'email': _email,
        'password' : _password,
      });
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  _fullName = value;
                },
                decoration: InputDecoration(
                  labelText: "FullName",
                  hintText: "Enter your full name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  _email = value;
                },
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email address",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  _password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => _registerUser(),
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
