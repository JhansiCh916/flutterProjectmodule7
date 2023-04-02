import 'package:flutter/material.dart';

class BooksCategoryScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryItem;
  //
  // BooksCategoryScreen(this.categoryId, this.categoryItem);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    // if (routeArgs == null) {
    //
    // }
    final categoryTitle = routeArgs["title"];
    final categoryId = routeArgs["id"];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? "dfsdfdsf"),
      ),
      body: Center(
        child: Text("Books"),
      ),
    );
  }
}
