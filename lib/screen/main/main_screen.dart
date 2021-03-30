import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_app/data/util/colors.dart';
import 'home/home_screen.dart';
import 'cart/cart_screen.dart';
import 'favorite/favorite_screen.dart';
import 'settings/settings_screen.dart';

class MainScreen extends StatefulWidget {
  static Widget screen() => MainScreen();

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey,
      body: IndexedStack(
        index: index,
        children: [
          HomeScreen.screen(),
          CartScreen.screen(),
          FavoriteScreen.screen(),
          SettingsScreen.screen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MyColors.white,
        selectedItemColor: MyColors.blue,
        unselectedItemColor: MyColors.greyDark,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (value) => setState(() => index = value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
