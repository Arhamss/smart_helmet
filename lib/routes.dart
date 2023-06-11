import 'package:smart_helmet/start_ride.dart';

import 'contact_page.dart';
import 'home_page.dart';
import 'login.dart';
import 'main_page.dart';
import 'start_page.dart';
import 'welcome.dart';

final routes = {
  MainPage.id: (context) => const MainPage(),
  StartPage.id: (context) => const StartPage(),
  WelcomePage.id: (context) => const WelcomePage(),
  LoginScreen.id: (context) => const LoginScreen(),
  HomePage.id: (context) => const HomePage(),
  ContactScreen.id: (context) => const ContactScreen(),
  StartRidePage.id: (context) => const StartRidePage(),
};
