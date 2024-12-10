import 'package:flutter/material.dart';
import 'package:grocery_store/widgets/categories_widgets.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CategoriesWidgets(),
      ),
    );
  }
}
