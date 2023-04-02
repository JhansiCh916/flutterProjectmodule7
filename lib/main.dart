import '../booksCategoryWiseScreen.dart';
import 'package:flutter/material.dart';
import './booksList.dart';

void main() {
  runApp(BooksStore());
}

class BooksStore extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BooksStore",
      theme: ThemeData(primarySwatch : Colors.brown,canvasColor: Color.fromRGBO(255, 254, 229, 1)),
      home: Bookslist(),
      routes: {
        "categories": (context) => BooksCategoryScreen(),
      },
    );
  }
}

// class HomePage extends StatefulWidget {
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("BooksStore"),
//       ),
//     );
//   }
// }
