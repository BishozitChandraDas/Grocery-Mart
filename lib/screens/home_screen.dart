import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_store/consts/contss.dart';
import 'package:grocery_store/inner_screens/feeds_screen.dart';
import 'package:grocery_store/inner_screens/on_sale_screen.dart';
import 'package:grocery_store/provider/dark_theme_provider.dart';
import 'package:grocery_store/services/global_methods.dart';
import 'package:grocery_store/services/utils.dart';
import 'package:grocery_store/widgets/feed_items_widget.dart';
import 'package:grocery_store/widgets/on_sale_widget.dart';
import 'package:grocery_store/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final List<String> _offerImages = [
  //   'assets/images/offers/offer1.jpg',
  //   'assets/images/offers/offer2.jpg',
  //   'assets/images/offers/offer3.jpg',
  //   'assets/images/offers/offer4.jpg',
  // ];

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final Color color = Utils(context).color;
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
   
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.3,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    Contss.offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: Contss.offerImages.length,
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.red)),
                // control: SwiperControl(color: Colors.black), // Slider sign
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextButton(
              onPressed: () {
                GlobalMethods.navigateTo(
                    ctx: context, routeName: OnSaleScreen.routeName);
              },
              child: TextWidget(
                text: 'View all',
                color: Colors.blue,
                textSize: 20,
                maxLines: 1,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            // SizedBox(
            //   height: size.height * 0.24,
            //   child: ListView.builder(
            //       itemCount: 10,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (ctx, index) {
            //         return const OnSaleWidget();
            //       }),
            // ),
            SizedBox(
              child: Row(
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: Row(
                      children: [
                        TextWidget(
                          text: 'On sale'.toUpperCase(),
                          color: Colors.red,
                          textSize: 22,
                          isTitle: true,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          IconlyLight.discount,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: SizedBox(
                      height: size.height * 0.24,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return const OnSaleWidget();
                        },  
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Our products',
                    color: color,
                    textSize: 22,
                    isTitle: true,
                  ),
                  // const Spacer(),
                  TextButton(
                    onPressed: () {
                        GlobalMethods.navigateTo(
                    ctx: context, routeName: FeedsScreen.routeName);
                    },
                    child: TextWidget(
                      text: 'Browse all',
                      maxLines: 1,
                      color: Colors.blue,
                      textSize: 20,
                    ),
                  )
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              // crossAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.55),
              children: List.generate(4, (index) {
                return const FeedItemsWidget();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
