import 'package:flutter/material.dart';
import 'package:grocery_store/screens/cart.dart';
import 'package:grocery_store/screens/categories.dart';
import 'package:grocery_store/screens/home_screen.dart';
import 'package:grocery_store/screens/user.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List _pages = [HomeScreen(), CategoriesScreen(), CartScreen(), UserScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[1],
    );
  }
}
