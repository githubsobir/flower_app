import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  static Widget screen() => CartScreen();

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Cart"));
  }
}
