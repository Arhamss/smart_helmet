import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_helmet/start_page.dart';
import 'package:smart_helmet/start_ride.dart';
import 'package:smart_helmet/welcome.dart';

import 'contact_page.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool connected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
              Navigator.pushNamed(context, StartPage.id);
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0XFFd8e8e8),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 1,
            left: -50,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF08f4dc).withOpacity(0.35),
                backgroundBlendMode: BlendMode.srcOver,
              ),
            ),
          ),
          Positioned(
            top: -50,
            left: 50,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF08f4dc).withOpacity(0.35),
                backgroundBlendMode: BlendMode.srcOver,
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -50,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF08f4dc).withOpacity(0.35),
                backgroundBlendMode: BlendMode.srcOver,
              ),
            ),
          ),
          Positioned(
            top: 180,
            child: SvgPicture.asset(
              "svgs/helmet.svg",
              height: 200,
              width: 200,
            ),
          ),
          Positioned(
            top: 410,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF08f4dc),
                foregroundColor: const Color(0xFF08f4dc),
                elevation: 0,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
              ),
              onPressed: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );

                await Future.delayed(const Duration(seconds: 2));

                setState(() {
                  connected = !connected;
                });

                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(64, 16, 64, 16),
                child: Text(
                  connected ? "Connected" : "Connect",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 500,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: const Color(0xFF08f4dc),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(48),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, ContactScreen.id);
                      },
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(64, 16, 64, 16),
                        child: Text(
                          "Import Contacts",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (connected)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, StartRidePage.id);
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(64, 16, 64, 16),
                          child: Text(
                            "Start Ride",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
