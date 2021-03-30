import 'package:dio/dio.dart';
import 'package:fl_app/data/hive/hive_service.dart';
import 'package:fl_app/data/net/net_service.dart';
import 'package:fl_app/data/util/colors.dart';
import 'package:fl_app/di/locator.dart';
import 'package:fl_app/screen/fail/fail_screen.dart';
import 'package:fl_app/screen/main/home/bloc/home_bloc.dart';
import 'package:fl_app/screen/main/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static Widget screen() => SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    final int SLEEP_TIME = 5;
    final DateTime time = DateTime.now();
    await locatorSetup();
    NetService netService = locator.get();
    HiveService hiveService = locator.get();
    await netService.auth();
    final products = await netService.getProduct();
    final category = await netService.getCategory();
    final card = await netService.getCard();
    if (products.status != 1 || category.status != 1 || card.status != 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => FailScreen.screen(message: "Xatolik"),
        ),
      );
      return;
    }

    await hiveService.setProduct(products);
    await hiveService.setCategory(category);
    await hiveService.setCard(card);

    // final int difference = time.difference(DateTime.now()).inSeconds;
    // if (SLEEP_TIME + difference > 0)
    //   await Future.delayed(Duration(seconds: SLEEP_TIME + difference));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => MainScreen.screen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.grey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: MyColors.white,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/img_loading.gif",
                  width: 140,
                  height: 140,
                ),
                SizedBox(height: 10),
                Text(
                  "Yuklanmoqda...",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
