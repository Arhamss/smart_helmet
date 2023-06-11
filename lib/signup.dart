import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_helmet/home_page.dart';
import 'package:smart_helmet/login.dart';
import 'package:smart_helmet/widgets/background_widget.dart';
import 'package:smart_helmet/widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  static const String id = 'SignUpPage';
  const SignUpPage({
    Key? key,
    required this.name,
    required this.age,
    required this.bloodGroup,
  }) : super(key: key);

  final String name;
  final String age;
  final String bloodGroup;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  final String hintUsername = 'Username';
  final String hintEmail = 'Email';

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    "Sign Up",
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
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: const Color(0xFF08f4dc),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: usernameController,
                        hint: hintUsername,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: emailController,
                        hint: hintEmail,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          obscureText: _obscureText,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            contentPadding: const EdgeInsets.only(
                              left: 50,
                              right: 0,
                              top: 20,
                              bottom: 20,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () => _toggle(),
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
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                    if (usernameController.text != '' &&
                        emailController.text != '' &&
                        passwordController.text != '') {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return Center(
                            child: const CircularProgressIndicator(),
                          );
                        },
                      );

                      final userCredential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );

                      await userCredential.user!.updateDisplayName(
                        widget.name,
                      );

                      emailController.text = '';

                      passwordController.text = '';

                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    }
                  } on FirebaseAuthException catch (e) {
                    Navigator.pop(context);

                    if (e.code == 'email-already-in-use') {
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
                    } else if (e.code == 'operation-not-allowed') {
                      Fluttertoast.showToast(
                        msg: e.message!,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: const Color(0xFF58C092),
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    } else {
                      Fluttertoast.showToast(
                        msg: "To sign up, please enter your information above.",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: const Color(0xFF08f4dc),
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(40, 16, 40, 16),
                  child: Text(
                    "Sign Up",
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
                    const TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Login',
                      style: const TextStyle(
                        color: Color(0xFF08f4dc),
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
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
