import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/constant/imageassate.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About App',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w900,fontSize:25)),
        elevation: 0,
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
      ),

    );
  }
}
