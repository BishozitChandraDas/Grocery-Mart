import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_store/inner_screens/product_details_screen.dart';
import 'package:grocery_store/services/global_methods.dart';
import 'package:grocery_store/services/utils.dart';
import 'package:grocery_store/widgets/heart_btn.dart';
import 'package:grocery_store/widgets/text_widget.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          GlobalMethods.navigateTo(
              ctx: context, routeName: ProductDetailsScreen.routeName);
        },
        child: Container(
          height: size.height * 0.2,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: color, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 8),
                width: size.width * 0.2,
                height: size.height * 0.15,
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/apple_poster.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            IconlyLight.bag2,
                            color: color,
                          ),
                        ),
                        HeartBtn()
                      ],
                    ),
                  ),
                  Flexible(
                    child: TextWidget(
                      text: "Title",
                      color: color,
                      textSize: 20,
                      maxLines: 2,
                      isTitle: true,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextWidget(
                    text: "\$2.59",
                    color: color,
                    textSize: 18,
                    maxLines: 1,
                    isTitle: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
