import 'package:flutter/material.dart';
import 'package:grocery_store/services/utils.dart';
import 'package:grocery_store/widgets/categories_widgets.dart';
import 'package:grocery_store/widgets/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  List<Color> gridColors = [ 
    const Color(0xffD3B0E0),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xff53B175),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];
 
  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/categories/fruits.png',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/categories/vegetables.png',
      'catText': 'Vegetables',
    },
    {
      'imgPath': 'assets/images/categories/herbs.png',
      'catText': 'Herbs',
    },
    {
      'imgPath': 'assets/images/categories/nuts.png',
      'catText': 'Nuts',
    },
    {
      'imgPath': 'assets/images/categories/spices.png',
      'catText': 'Spices',
    },
    {
      'imgPath': 'assets/images/categories/grains.png',
      'catText': 'Grains',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Categories',
          color: color,
          textSize: 24,
          isTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count( 
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          crossAxisSpacing: 10, // Vertical spacing
          mainAxisSpacing: 10, //Horizontal spacing
          children: List.generate(6, (index) {
            return CategoriesWidgets(
              catText: catInfo[index]['catText'],
              imgPath: catInfo[index]['imgPath'],
              passedColor: gridColors[index],
            );
          }),
        ),
      ),
    );
  }
}
