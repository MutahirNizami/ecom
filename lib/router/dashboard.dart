import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:newappui_8/contoller/cartcontroller.dart';
import 'package:newappui_8/contoller/whislist_controller.dart';
import 'package:newappui_8/utilis/colors.dart';
import 'package:newappui_8/view/Awosome_screen.dart';
import 'package:newappui_8/view/Mycart_screen.dart';
import 'package:newappui_8/view/checkout_screen.dart';
import 'package:newappui_8/view/ecom_product.dart';
import 'package:newappui_8/view/payementmethod.dart';
import 'package:newappui_8/view/Accountdetail/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<dynamic> _pages = [
    EcomProductScreen(),
    const MycartScreen(),
    const CheckoutScreen(),
    const PayementmethodScreen(),
    const AwosomeScreen(),
  ];
  int selectedIndex = 0;
  final WishlistController _wishlistController = Get.put(WishlistController());
  final CartlistController _cartlistController = Get.put(CartlistController());

  @override
  void initState() {
    super.initState();
    _checkUserData();
  }

  Future<void> _checkUserData() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // Redirect to login screen if no user is logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
      return;
    }

    try {
      // Fetch user document from Firestore
      var userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        // If the user document exists, check and load the wishlist and cart
        var userData = userDoc.data();
        if (userData != null) {
          var wishlist = userData['wishlist'] as List?;
          var cart = userData['cart'] as List?;

          if (wishlist != null && wishlist.isNotEmpty) {
            // Fetch wishlist data
            _wishlistController.fetchWishlist(user.uid);
          } else {
            _wishlistController.clearWishlist();
          }

          if (cart != null && cart.isNotEmpty) {
            // Fetch cart data
            _cartlistController.fetchCart(user.uid);
          } else {
            _cartlistController.clearCart();
          }

          // // Notify the UI to update
          // setState(() {});
        }
      } else {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'wishlist': [],
          'cart': [],
        });

        _wishlistController.clearWishlist();
        _cartlistController.clearCart();

        // // Notify the UI to update
        //  setState(() {});
      }
    } catch (e) {
      log('Error checking user data: ${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error occurred: ${e.toString()}'),
        ),
      );
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Appcolors().contianercolor,
        selectedFontSize: height * 0.015,
        elevation: height * 0.02,
        items: [
          BottomNavigationBarItem(
            icon: selectedIndex == 0
                ? Icon(Icons.home_rounded)
                : const Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 1
                ? const Icon(Icons.shopping_bag)
                : const Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 2
                ? const Icon(Icons.shopping_cart_sharp)
                : const Icon(Icons.shopping_cart_outlined),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 3
                ? const Icon(Icons.account_balance_wallet)
                : const Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 4
                ? const Icon(Icons.person)
                : const Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Appcolors().titletextcolor,
        unselectedItemColor: Appcolors().subtitlecolor,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
