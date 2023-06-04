import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_helmet/welcome.dart';

class StartPage extends StatefulWidget {
  static const String id = 'StartPage';
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFd8e8e8),
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
                color: Color(0xFF08f4dc).withOpacity(0.35),
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
                color: Color(0xFF08f4dc).withOpacity(0.35),
                backgroundBlendMode: BlendMode.srcOver,
              ),
            ),
          ),
          Positioned(
              top: 250,
              child: Text(
                "SMART HELMET",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              )),
          Positioned(
            top: 300,
            child: SvgPicture.asset(
              "svgs/person_cycling.svg",
              height: 300,
              width: 300,
            ),
          ),
          Positioned(
            top: 610,
            left: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF08f4dc),
                foregroundColor: Color(0xFF08f4dc),
                elevation: 0,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, WelcomePage.id);
              },
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
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
                color: Color(0xFF08f4dc).withOpacity(0.35),
                backgroundBlendMode: BlendMode.srcOver,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
