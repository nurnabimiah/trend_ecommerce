
import 'package:ecommerce_app/view/features/authentication/registration_screen/registration_screen.dart';
import 'package:ecommerce_app/view/features/cart/screen/cart_screen.dart';
import 'package:ecommerce_app/view/features/fevorite/screen/favorite_screen.dart';
import 'package:ecommerce_app/view/features/menu_screen/menu_screen.dart';
import 'package:flutter/material.dart';

import '../home_screen/home_screen.dart';
import '../my_order_screens/my_order_screen.dart';
import '../my_order_screens/order_details_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  static const String routeName = '/CustomBottomNavBarScreen';
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;

  // Handle bottom navigation bar item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 20,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favourite',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Cart',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'My Order',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),


          ],
        ),
      ),
    );
  }


 getBody() {
    if (_selectedIndex == 0 ) {
      return const HomeScreen();
    }
    if (_selectedIndex == 1) {
      return  FavoriteScreen();
    }
    if (_selectedIndex == 2) {
      return const CartScreen();
    }
    if (_selectedIndex == 3) {
      return MyOrderScreen();

    }
    if (_selectedIndex == 4) {
      return  MenuScreen();
    }
    return null;
  }
}