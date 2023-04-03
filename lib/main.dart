import 'package:books/Screens/booksList.dart';
import '../Screens/filterScreen.dart';
import 'package:flutter/material.dart';
import '../Screens/tabScreen.dart';
import '../Screens/bookDetailScreen.dart';
import '../Screens/booksCategoryWiseScreen.dart';

void main() {
  runApp(BooksStore());
}

class BooksStore extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BooksStore",
      theme: ThemeData(
          primarySwatch: Colors.brown,
          canvasColor: Color.fromRGBO(255, 254, 229, 1)),
      // home: Bookslist(),
      // initialRoute: '/',
      routes: {
        "/": (context) => TabsScreen(),
        BooksCategoryScreen.routeName: (context) => BooksCategoryScreen(),
        BookDetailScreen.routeName: (context) => BookDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (context) => BooksCategoryScreen());
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (context) => BooksCategoryScreen());
      // },
    );
  }
}