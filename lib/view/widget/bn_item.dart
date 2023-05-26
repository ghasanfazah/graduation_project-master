import 'package:flutter/material.dart';
import 'package:marketing_graduation/core/constant/coloes.dart';

class BnItem extends StatelessWidget {
  BnItem({
    super.key,
    required this.onPressed,
    required this.title,
    required this.bnIcon,
    required this.selectItemColor,
  });

  void Function()? onPressed;
  final String title;
  final IconData bnIcon;
  final bool? selectItemColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            bnIcon,
            color:selectItemColor==true?ColorApp.colorsRed: Colors.black54,
          ),
          Text(
            title,
            style: TextStyle(color:selectItemColor==true?ColorApp.colorsRed: Colors.black54),
          ),
        ],
      ),
    );
  }
}
