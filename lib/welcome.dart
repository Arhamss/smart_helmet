import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_helmet/signup.dart';

class WelcomePage extends StatefulWidget {
  static const String id = "WelcomePage";
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();

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
            left: 80,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Color(0xFF08f4dc),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(64, 16, 64, 16),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

          //welcome done above.
          Positioned(
            top: 350,
            child: Container(
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Color(0xFF08f4dc),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: nameController,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                            hintText: "Enter Full Name",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: ageController,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                            hintText: "Age",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: bloodGroupController,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                            hintText: "Blood Group",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF08f4dc),
                elevation: 0,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, SignUpPage.id);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 16, 40, 16),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Single tapped.
                      },
                  ),
                  TextSpan(
                    text: ' Login',
                    style: TextStyle(
                      color: Color(0xFF08f4dc),
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, SignUpPage.id);
                      },
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

// ElevatedButton(
// style: ElevatedButton.styleFrom(
// backgroundColor: Colors.white,
// elevation: 0,
// padding: EdgeInsets.zero,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(48),
// ),
// ),
// onPressed: () {},
// child: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Text(
// "Get Started",
// style: TextStyle(
// color: Colors.black,
// fontSize: 30,
// ),
// ),
// ),
// ),
