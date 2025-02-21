import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';

class HeartBtn extends StatelessWidget {
  const HeartBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return GestureDetector(
      onTap: () {
        print('Print heart button is pressed');
      },
      child: Icon(
        IconlyLight.heart, 
        size: 22,
        color: color,
      ),
    );
  }
}
