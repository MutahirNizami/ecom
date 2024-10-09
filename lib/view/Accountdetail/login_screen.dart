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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool loading = false;
  String email = '', password = '';

  Future<void> fetchWishlistAndCartData(String uid) async {
    try {
      var wishlistSnapshot = await FirebaseFirestore.instance
          .collection('wishlist')
          .doc(uid)
          .get();

      var cartSnapshot =
          await FirebaseFirestore.instance.collection('cart').doc(uid).get();

      if (wishlistSnapshot.exists) {
        log("Wishlist data fetched for user: $uid");
      }

      if (cartSnapshot.exists) {
        log("Cart data fetched for user: $uid");
      }
    } catch (e) {
      log("Error fetching wishlist or cart: $e");
    }
  }

  //  login process
  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        email = _emailController.text.trim();
        password = _passwordController.text.trim();
      });
      try {
        setState(() {
          loading = true;
        });
        // Sign in the user
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // If user successfully logs in
        if (userCredential.user != null) {
          String uid = userCredential.user!.uid;

          await fetchWishlistAndCartData(uid);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const DashboardScreen(),
            ),
          );
        }

        setState(() {
          loading = false;
        });
      } on FirebaseAuthException catch (e) {
        setState(() {
          loading = false;
        });
        String errorMessage = e.code == 'user-not-found'
            ? "User not found. Please sign up first."
            : e.code == 'wrong-password'
                ? "Incorrect password. Please try again."
                : "Login failed: ${e.message}";

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Appcolors().heartcolor,
          content: Text(
            errorMessage,
            style: const TextStyle(fontSize: 20),
          ),
        ));
        log(e.toString());
      }
    } else {
      setState(() {
        loading = false;
      });
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
                    loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Appbutton(
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
