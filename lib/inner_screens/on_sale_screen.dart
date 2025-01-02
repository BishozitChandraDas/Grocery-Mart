import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_store/services/utils.dart';
import 'package:grocery_store/widgets/back_widget.dart';
import 'package:grocery_store/widgets/on_sale_widget.dart';
import 'package:grocery_store/widgets/text_widget.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = '/OnSaleScreen';
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isEmpty = false;
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        leading: const BackWidget(),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: TextWidget(
          text: 'Products on sale',
          color: color,
          textSize: 24,
          isTitle: true,
        ),
      ),
      body: _isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Image.asset(
                        'assets/images/offers/empty_box.png',
                      ),
                    ),
                    Text(
                      'No products on sale yet!,\nStay tuned',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: color,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              // crossAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.45),
              children: List.generate(16, (index) {
                return const OnSaleWidget();
              }),
            ),
    );
  }
}
