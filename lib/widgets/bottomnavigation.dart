import 'package:flutter/material.dart';
import 'package:newappui_8/utilis/colors.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => __Bottomnavigation();
}

class __Bottomnavigation extends State<Bottomnavigation> {
  int _selectedIndex = 0;

  static const List<Widget> pages = [
    Center(child: Text('Home')),
    Center(child: Text('Cart')),
    Center(child: Text('Orders')),
    Center(child: Text('Wallet')),
    Center(child: Text('Account')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Appcolors().titletextcolor,
        unselectedItemColor: Appcolors().contianercolor,
        onTap: _onItemTapped,
      ),
    );
  }
}
