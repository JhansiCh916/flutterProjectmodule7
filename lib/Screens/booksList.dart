import '../Widgets/categoryItem.dart';
import 'package:flutter/material.dart';
import '../dummyCategories.dart';

class Bookslist extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,
        childAspectRatio: 3/2,crossAxisSpacing: 20,mainAxisSpacing: 20),
        children: DummyCategories.map((categry) =>
            CategoryItem(categry.title, categry.id, categry.colours)).toList(),
      );
  }
}
