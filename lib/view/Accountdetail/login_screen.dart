import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newappui_8/router/dashboard.dart';
import 'package:newappui_8/utilis/colors.dart';
import 'package:newappui_8/view/Accountdetail/sign_up_screen.dart';
import 'package:newappui_8/widgets/button.dart';
import 'package:newappui_8/widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String email = '', password = '';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        email = _emailController.text.trim();
        password = _passwordController.text.trim();
      });

      try {
        // Sign in the user
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        String uid = userCredential.user!.uid; // Get the unique user ID (uid)

        // Store or update the user's data in Firestore
        await _firestore.collection('users').doc(uid).set({
          'email': email,
          'id': uid, // Store the unique user ID
          'lastLogin': DateTime.now(), // Store the last login time
        }, SetOptions(merge: true)); // Merge with existing data

        // Navigate to DashboardScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        String errorMessage;

        if (e.code == 'user-not-found') {
          errorMessage = "User not found. Please sign up first.";
        } else if (e.code == 'wrong-password') {
          errorMessage = "Incorrect password. Please try again.";
        } else {
          errorMessage = "Login failed: ${e.message}";
        }

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Appcolors().heartcolor,
          content: Text(
            errorMessage,
            style: const TextStyle(fontSize: 20),
          ),
        ));

        log(e.toString());
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Appcolors().heartcolor,
          content: Text(
            "An error occurred: ${e.toString()}",
            style: const TextStyle(fontSize: 20),
          ),
        ));
        log(e.toString());
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Please fill in all fields",
          style: TextStyle(fontSize: 20),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: height * 0.5,
                width: width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: height * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    CustomTextFormField(
                      controller: _emailController,
                      hintText: 'Enter Email',
                      prefixIcon: Icons.email,
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      hintText: 'Enter Password',
                      isPassword: true,
                      prefixIcon: Icons.lock,
                    ),
                    Appbutton(
                      borderradius: height * 0.025,
                      btnwidth: width,
                      btnheight: height * 0.07,
                      ontap: () {
                        _login();
                      },
                      text: "Log In",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Appcolors().blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
