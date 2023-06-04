import 'package:flutter/material.dart';
import 'package:smart_helmet/contact_page.dart';
import 'package:smart_helmet/login.dart';
import 'package:smart_helmet/signup.dart';
import 'package:smart_helmet/start_page.dart';
import 'package:smart_helmet/welcome.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ContactScreen.id,
      routes: {
        StartPage.id: (context) => const StartPage(),
        WelcomePage.id: (context) => const WelcomePage(),
        SignUpPage.id: (context) => const SignUpPage(),
        LoginScreen.id: (context) => const LoginScreen(),
        HomePage.id: (context) => const HomePage(),
        ContactScreen.id: (context) => const ContactScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
