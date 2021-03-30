import 'package:flutter/material.dart';
import 'package:fl_app/data/util/colors.dart';

class WidgetCategory extends StatelessWidget {
  final String name;
  final bool selected;
  final VoidCallback? onPressed;

  WidgetCategory({
    required this.name,
    required this.selected,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: double.infinity,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: selected ? MyColors.greyDark.withOpacity(0.3) : MyColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: onPressed,
        child: Row(
          children: [
            SizedBox(width: 10),
            Icon(
              Icons.favorite_border,
              color: MyColors.blue,
            ),
            SizedBox(width: 5),
            Text(name.length > 10 ? "${name.substring(0, 10)}..." : name),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
