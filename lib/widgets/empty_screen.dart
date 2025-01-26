import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/inner_screens/feeds_screen.dart';
import 'package:grocery_store/services/global_methods.dart';
import 'package:grocery_store/services/utils.dart';
import 'package:grocery_store/widgets/text_widget.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subtitle,
      required this.buttontext});
  final String imagePath, title, subtitle, buttontext;
 
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    final themeState = Utils(context).getTheme;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              imagePath,
              width: double.infinity,
              height: size.height * 0.4,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Whoops!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
                text: title,
                color: Colors.cyan,
                textSize: 20),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
                text: subtitle, 
                color: Colors.cyan,
                textSize: 20),
            SizedBox(
              height: size.height * 0.08,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: color,
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                // foregroundColor: color,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
              ),
              onPressed: () {
                GlobalMethods.navigateTo(
                    ctx: context, routeName: FeedsScreen.routeName);
              },
              child: TextWidget(
                text: buttontext,
                textSize: 20,
                color: themeState ? Colors.grey.shade300 : Colors.grey.shade800,
                isTitle: true,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
