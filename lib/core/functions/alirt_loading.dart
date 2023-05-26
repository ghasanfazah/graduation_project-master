import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:lottie/lottie.dart';

alirtLoading(context,title) async {
  showDialog(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 100,
          child: AlertDialog(
              content: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const Center(child: CircularProgressIndicator())
              ],
            ),
          )),
        );
      });
}

