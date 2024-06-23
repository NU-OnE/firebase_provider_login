import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () async {
            final provider = OAuthProvider('microsoft.com');
            provider.setCustomParameters({
              'tenant': 'fe8ccb52-ca53-49de-a5b4-50faf33a9cc2',
            });

            await FirebaseAuth.instance.signInWithProvider(provider);
          },
          icon: const Icon(Icons.login),
          label: const Text('Login with Microsoft'),
        ),
      ),
    );
  }
}
