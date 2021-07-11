import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';

class Category_Item extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  Category_Item(
    this.id,
    this.title,
    this.color,
  );

  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealScreen.routName,

      arguments: {
        'id':id,
        'title':title
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Center(
            child: Text(title, style: Theme.of(context).textTheme.title)),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.4),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
      ),
      ),
    );
  }
}
