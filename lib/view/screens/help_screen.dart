import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/constant/imageassate.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w900,fontSize: 25),),
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 65,
        elevation: 0,
      ),

    );
  }
}
