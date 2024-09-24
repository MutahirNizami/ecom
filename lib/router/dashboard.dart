import 'package:flutter/material.dart';

import 'package:newappui_8/utilis/colors.dart';
import 'package:newappui_8/view/Awosome_screen.dart';
import 'package:newappui_8/view/Mycart_screen.dart';
import 'package:newappui_8/view/checkout_screen.dart';
import 'package:newappui_8/view/ecom_product.dart';
import 'package:newappui_8/view/payementmethod.dart';

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
                ? const Icon(Icons.home_rounded)
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
