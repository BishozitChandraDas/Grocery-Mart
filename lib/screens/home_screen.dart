import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/provider/dark_theme_provider.dart';
import 'package:grocery_store/services/utils.dart';
import 'package:grocery_store/widgets/on_sale_widget.dart';
import 'package:grocery_store/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offerImages = [
    'assets/images/offers/offer1.jpg',
    'assets/images/offers/offer2.jpg',
    'assets/images/offers/offer3.jpg',
    'assets/images/offers/offer4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.3,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  _offerImages[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount: _offerImages.length,
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
              onPressed: () {},
              child: TextWidget(
                text: 'View all',
                color: Colors.blue,
                textSize: 20,
                maxLines: 1,
              )),
          SizedBox(
            height: size.height * 0.24,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return OnSaleWidget();
                }),
          ),
        ],
      ),
    );
  }
}
