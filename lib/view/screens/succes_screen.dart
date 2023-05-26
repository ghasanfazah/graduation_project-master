import 'package:flutter/material.dart';
import 'package:marketing_graduation/core/constant/imageassate.dart';
import 'package:marketing_graduation/view/widget/success_widget.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds:3), () {
      Navigator.pushReplacementNamed(context, '/success_screen');
    },
    );
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
      SuccessWidget(title: '!مبروك', supTitle: 'تم انشاء الحساب بنجاح', centerIcon: ImageAssets.successIcon),
    );
  }
}

