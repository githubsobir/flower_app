import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  static Widget screen() => FavoriteScreen();

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Favorite"));
  }
}
