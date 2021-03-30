import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_app/data/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WidgetProduct extends StatelessWidget {
  final String name;
  final String price;
  final String rating;
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback? onPressedItem;
  final VoidCallback? onPressedFavorite;
  final VoidCallback? onPressedBuy;

  WidgetProduct({
    this.name = "",
    this.price = "",
    this.rating = "",
    this.imageUrl = "",
    this.isFavorite = false,
    this.onPressedItem,
    this.onPressedFavorite,
    this.onPressedBuy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: MyColors.greyDark,
              blurRadius: 3,
              offset: Offset(3, 3),
            ),
          ]),
      child: MaterialButton(
        onPressed: onPressedItem,
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(30),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: MyColors.white,
                        highlightColor: MyColors.greyDark.withOpacity(0.5),
                        child: Image.asset("assets/img_load_fl.png"),
                      ),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/img_fail.gif"),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.all(10),
                    child: MaterialButton(
                      minWidth: 50,
                      height: 50,
                      padding: EdgeInsets.all(0),
                      shape: CircleBorder(),
                      onPressed: onPressedFavorite,
                      child: Icon(
                        !isFavorite ? Icons.favorite_border : Icons.favorite,
                        color: MyColors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: MyColors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.money_dollar_circle_fill,
                        color: MyColors.blue,
                      ),
                      SizedBox(width: 4),
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.star_circle_fill,
                        color: MyColors.yellow,
                      ),
                      SizedBox(width: 4),
                      Text(
                        rating,
                        style: TextStyle(
                          fontSize: 16,
                          color: MyColors.greyDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  MaterialButton(
                    minWidth: 100,
                    onPressed: onPressedBuy,
                    color: MyColors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.shopping_cart,
                          color: MyColors.white,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Buy Now",
                          style: TextStyle(color: MyColors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
