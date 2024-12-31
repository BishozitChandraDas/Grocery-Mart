import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_store/inner_screens/product_details_screen.dart';
import 'package:grocery_store/services/global_methods.dart';
import 'package:grocery_store/widgets/heart_btn.dart';
import 'package:grocery_store/widgets/price_widget.dart';
import 'package:grocery_store/widgets/text_widget.dart';

import '../services/utils.dart';

class FeedItemsWidget extends StatefulWidget {
  const FeedItemsWidget({super.key});

  @override
  State<FeedItemsWidget> createState() => _FeedItemsWidgetState();
}

class _FeedItemsWidgetState extends State<FeedItemsWidget> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            GlobalMethods.navigateTo(
                ctx: context, routeName: ProductDetailsScreen.routeName);
          },
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              ClipRRect(
                // borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/apple_poster.png',
                  width: size.width * 0.22,
                  height: size.width * 0.2,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  // vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'Title',
                      color: color,
                      textSize: 20,
                      isTitle: true,
                    ),
                    const HeartBtn(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: PriceWidget(
                        salePrice: 2.99,
                        price: 5.9,
                        textPrice: _quantityTextController.text,
                        isOnSale: true,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                        child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: FittedBox(
                            child: TextWidget(
                              text: 'KG',
                              color: color,
                              textSize: 18,
                              isTitle: true,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                            flex: 2,
                            child: TextFormField(
                              controller: _quantityTextController,
                              key: const ValueKey('10'),
                              style: TextStyle(color: color, fontSize: 18),
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              enabled: true,
                              onChanged: (valueee) {
                                setState(() {});
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp('[0-9]'),
                                ),
                              ],
                            ))
                      ],
                    ))
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: TextWidget(
                    text: 'Add to cart',
                    maxLines: 1,
                    color: color,
                    textSize: 20,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).cardColor),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      )))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
