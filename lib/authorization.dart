import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_example/screens/home.dart';
import 'package:flutter_login_example/screens/login.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return const Text('An error occurred');
          }

          if (snapshot.hasData) {
            final user = snapshot.data as User;
            print(user);
            return const HomeScreen();
          }

          return const LoginScreen();
        });
  }
}
