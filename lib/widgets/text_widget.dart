// import 'package:flutter/material.dart';

// class TextWidget extends StatelessWidget {
//   TextWidget({
//     Key? key,
//     required this.text,
//     required this.color,
//     required this.textSize,
//     this.isTitle = false,
//     this.maxLines = 10, required Null Function() onPressed,
//   }) : super(key: key);
//   final String text;
//   final Color color;
//   final double textSize;
//   bool isTitle;
//   int maxLines = 10;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       maxLines: maxLines,
//       style: TextStyle(
//           overflow: TextOverflow.ellipsis,
//           color: color,
//           fontSize: textSize,
//           fontWeight: isTitle ? FontWeight.bold : FontWeight.normal),
//     );
//   }
// }



import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  final int? maxLines;
  final bool isTitle;
  final VoidCallback? onPressed; // Optional onPressed parameter

  const TextWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.textSize,
    this.maxLines,
    this.isTitle = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color,
          fontSize: textSize,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
