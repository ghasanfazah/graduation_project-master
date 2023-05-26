import 'package:flutter/material.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25,color: Colors.red),),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          toolbarHeight: 75,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
    );
  }
}
