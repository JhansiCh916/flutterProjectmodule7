import '../Widgets/bookItem.dart';
import '../dummyCategories.dart';
import 'package:flutter/material.dart';

class BooksCategoryScreen extends StatelessWidget {
  static const routeName = "/categories";
  // final String categoryId;
  // final String categoryItem;
  //
  // BooksCategoryScreen(this.categoryId, this.categoryItem);

  @override
  Widget build(BuildContext context) {
    final Map<String, String>? routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    // if (routeArgs == null) {
    //   return Scaffold();
    // }
    final String categoryTitle = routeArgs?["title"] ?? "title";
    final String categoryId = routeArgs?["id"] ?? "id";
    final selectedCategory = DummyBooksData.where((book) {
      return book.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
            return BookItem(selectedCategory[index].id,selectedCategory[index].title, selectedCategory[index].imageUrl, selectedCategory[index].pages, selectedCategory[index].complexity, selectedCategory[index].affordable);
      }, itemCount: selectedCategory.length, ),
    );
  }
}
