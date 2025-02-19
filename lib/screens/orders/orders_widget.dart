import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/inner_screens/product_details_screen.dart';
import 'package:grocery_store/services/global_methods.dart';
import 'package:provider/provider.dart';

import '../../services/utils.dart';
import '../../widgets/text_widget.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({Key? key}) : super(key: key); 

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return ListTile(
      subtitle: const Text('Paid: \$12.8'), 
      onTap: () {
        GlobalMethods.navigateTo(
            ctx: context, routeName: ProductDetailsScreen.routeName);
      },
      leading: ClipRRect(
        // borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/images/apple_poster.png',
          width: size.width * 0.15,
          height: size.height * 0.15,
          fit: BoxFit.fill,
        ),
      ),
      // FancyShimmerImage(
      //     width: size.width * 0.2,
      //     imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
      //     boxFit: BoxFit.fill,
      //   ),

      title: TextWidget(text: 'Title  x12', color: color, textSize: 18),
      trailing: TextWidget(text: '05/01/2025', color: color, textSize: 18),
    );
  }
}
