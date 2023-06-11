import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_helmet/home_page.dart';
import 'package:smart_helmet/start_page.dart';
import 'package:smart_helmet/welcome.dart';

class MainPage extends StatelessWidget {
  static const String id = 'MainPage';
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Something went wrong!',
              ),
            );
          } else if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const StartPage();
          }
        },
      ),
    );
  }
}
