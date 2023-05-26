import 'package:flutter/material.dart';

class ContactAsScreen extends StatefulWidget {
  const ContactAsScreen({Key? key}) : super(key: key);

  @override
  State<ContactAsScreen> createState() => _ContactAsScreenState();
}

class _ContactAsScreenState extends State<ContactAsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('Contact As',style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.w900),),
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      toolbarHeight: 65,
      centerTitle: true,
      backgroundColor: Colors.transparent,
    ),);
  }
}
