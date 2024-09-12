import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newappui_8/router/dashboard.dart';
import 'package:newappui_8/utilis/colors.dart';
import 'package:newappui_8/view/Accountdetail/login_screen.dart';
import 'package:newappui_8/widgets/button.dart';
import 'package:newappui_8/widgets/textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email = '', name = '', password = '';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signup() async {
    // Validate that the form is filled out correctly
    if (_formKey.currentState!.validate()) {
      email = _emailController.text.trim();
      name = _nameController.text.trim();
      password = _passwordController.text.trim();

      try {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        log("User registered with email: ${credential.user?.email}");

        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set({
          'id': credential.user!.uid,
          'name': name,
          'email': email,
          'wishlist': [], // Initialize empty wishlist
          'cart': [], // Initialize empty cart
        });

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Registration is complete",
            style: TextStyle(fontSize: 20),
          ),
        ));

        // Navigate to DashboardScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Appcolors().rattingiconcolor,
            content: const Text(
              "Please enter a stronger password",
              style: TextStyle(fontSize: 20),
            ),
          ));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Appcolors().heartcolor,
            content: const Text(
              "This email is already in use",
              style: TextStyle(fontSize: 20),
            ),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Registration failed: ${e.message}",
              style: const TextStyle(fontSize: 20),
            ),
          ));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "An error occurred: ${e.toString()}",
            style: const TextStyle(fontSize: 20),
          ),
        ));
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
                height: height * 0.9,
                width: width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: height * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    CustomTextFormField(
                      controller: _nameController,
                      hintText: 'Name',
                      prefixIcon: Icons.person,
                    ),
                    CustomTextFormField(
                      controller: _emailController,
                      hintText: 'Email',
                      prefixIcon: Icons.email_outlined,
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      hintText: 'Create Password',
                      isPassword: true,
                      prefixIcon: Icons.lock,
                    ),
                    Appbutton(
                      btnheight: height * 0.05,
                      btnwidth: width * 0.9,
                      borderradius: height * 0.02,
                      ontap: () {
                        signup();
                      },
                      text: "Sign Up",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("You already have an account? "),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Appcolors().blue),
                          ),
                        )
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
