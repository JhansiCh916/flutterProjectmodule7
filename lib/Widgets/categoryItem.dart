import '../Screens/booksCategoryWiseScreen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  CategoryItem(this.title, this.id, this.color);

  void selectedCategoryOfBooks(BuildContext context) {
    Navigator.of(context).pushNamed(BooksCategoryScreen.routeName,arguments: {
      "id" : id,
      "title" : title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategoryOfBooks(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.1),color],
              begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
            borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
