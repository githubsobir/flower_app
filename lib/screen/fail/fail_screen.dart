import 'package:flutter/material.dart';

class FailScreen extends StatefulWidget {
  static Widget screen({required String message}) => FailScreen(message);
  final String message;

  FailScreen(this.message);

  @override
  _FailScreenState createState() => _FailScreenState();
}

class _FailScreenState extends State<FailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.message)),
    );
  }
}
