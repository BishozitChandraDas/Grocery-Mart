import 'package:flutter/material.dart';
import 'package:grocery_store/inner_screens/product_details_screen.dart';
import 'package:grocery_store/services/global_methods.dart';
import 'package:grocery_store/services/utils.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return GestureDetector(
      onTap: () {
        GlobalMethods.navigateTo(
            ctx: context, routeName: ProductDetailsScreen.routeName);
      },
      child: Container(
        height: size.height * 0.2,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.5),
          border: Border.all(color: color, width: 0.5),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
