import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_helmet/home_page.dart';
import 'package:smart_helmet/signup.dart';
import 'package:smart_helmet/widgets/background_widget.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'SignUpScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: const Color(0xFF08f4dc),
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(64, 16, 64, 16),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: const Color(0xFF08f4dc),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: usernameController,
                          textAlign: TextAlign.left,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                          decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: Colors.white,
                              hintText: "Email",
                              hintStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          obscureText: _obscureText,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          textAlign: TextAlign.left,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                          decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText == true
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility,
                                  color: const Color(0xFF08f4dc),
                                ),
                              ),
                              fillColor: Colors.white,
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF08f4dc),
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () async {
                  try {
                    if (usernameController.text != '') {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );

                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: usernameController.text,
                        password: passwordController.text,
                      );

                      usernameController.text = '';

                      passwordController.text = '';

                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    }
                  } on FirebaseAuthException catch (e) {
                    Navigator.pop(context);

                    if (e.code == 'user-disabled') {
                      Fluttertoast.showToast(
                        msg: e.message!,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: const Color(0xFF58C092),
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    } else if (e.code == 'invalid-email') {
                      Fluttertoast.showToast(
                        msg: e.message!,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: const Color(0xFF58C092),
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    } else if (e.code == 'weak-password') {
                      Fluttertoast.showToast(
                        msg: e.message!,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: const Color(0xFF58C092),
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    } else if (e.code == 'user-not-found') {
                      Fluttertoast.showToast(
                        msg: e.message!,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: const Color(0xFF58C092),
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(40, 16, 40, 16),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Don't have an account?",
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        recognizer: TapGestureRecognizer()),
                    TextSpan(
                      text: ' Sign Up',
                      style: const TextStyle(
                        color: Color(0xFF08f4dc),
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacementNamed(
                              context, SignUpPage.id);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
