import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ChickInternetScreen extends StatefulWidget {
  const ChickInternetScreen({Key? key}) : super(key: key);

  @override
  State<ChickInternetScreen> createState() => _ChickInternetScreenState();
}

class _ChickInternetScreenState extends State<ChickInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(builder: (context, snapshot) {
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Lottie.asset('lottie/no-internet-connection.json'),
              const SizedBox(
                height: 20,
              ),
              const Text('!تعذر الاتصال'),
              const Text('لا يوجد اتصال بالانترنت حاول مرة اخرى'),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {},
                child: const Text("اعادة تحميل"),
              ),
            ],
          ),
        ),
      );
    });
  }
}
