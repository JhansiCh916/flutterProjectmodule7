import 'package:books/Screens/booksList.dart';
import '../dummyCategories.dart';
import '../Screens/filterScreen.dart';
import 'package:flutter/material.dart';
import '../Screens/tabScreen.dart';
import '../Screens/bookDetailScreen.dart';
import '../Screens/booksCategoryWiseScreen.dart';
import '../models/booksData.dart';

void main() {
  runApp(BooksStore());
}

class BooksStore extends StatefulWidget {
  @override
  State<BooksStore> createState() => _BooksStoreState();
}

class _BooksStoreState extends State<BooksStore> {
  Map<String, bool> _filters =
    {
      "iskidsrelated": false,
    };

  List<Book> _availableBooks = DummyBooksData;
  List<Book> favouriteBooks = [];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableBooks = DummyBooksData.where((book) {
          if (_filters["iskidsrelated"]! && !book.isItOkToKids) {
            return false;
          }
          return true;
      }).toList();
    });
  }

  void toggleFavourite(String bookId) {
    final existingIndex = favouriteBooks.indexWhere((book) {
      return book.id == bookId;
    });
    if (existingIndex >= 0){
        setState(() {
          favouriteBooks.removeAt(existingIndex);
        });
    } else {
      setState(() {
        favouriteBooks.add(DummyBooksData.firstWhere((book) => book.id == bookId));
      });
    }
  }

  bool isBookFavourite(String bookId) {
    return favouriteBooks.any((book) => book.id == bookId);
  }

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
        "/": (context) => TabsScreen(favouriteBooks),
        BooksCategoryScreen.routeName: (context) => BooksCategoryScreen(_availableBooks),
        BookDetailScreen.routeName: (context) => BookDetailScreen(toggleFavourite, isBookFavourite),
        FiltersScreen.routeName: (context) => FiltersScreen(setFilters, _filters),
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