import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medi_tect_admin/screen/home_screen.dart';
import 'package:medi_tect_admin/screen/login_screen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, streamSnapshot) {
                if (streamSnapshot.connectionState != ConnectionState.active) {
                  return LoginScreen();
                }
                final user = streamSnapshot.data;
                if (user != null) {
                  return HomeScreen();
                } else {
                  return LoginScreen();
                }
              });
        }
        return Scaffold(
          body: Center(
            child: Text("Loading"),
          ),
        );
      },
    );
  }
}
