import 'package:flutter/material.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    super.key,
    required this.title,
    required this.supTitle,
    required this.centerIcon,
  });

  final String title;
  final String supTitle;
  final String centerIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            centerIcon,
            width: 150,
            height: 150,
          ),
          const SizedBox(
            height: 35,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 35,
            ),
          ),
          Text(
            supTitle,
            style: const TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
