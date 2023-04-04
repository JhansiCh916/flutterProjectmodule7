import '../Widgets/bookItem.dart';
import '../dummyCategories.dart';
import 'package:flutter/material.dart';
import '../models/booksData.dart';

class BooksCategoryScreen extends StatefulWidget {
  static const routeName = "/categories";

  final List<Book> availableBooks;

  BooksCategoryScreen(this.availableBooks);

  @override
  State<BooksCategoryScreen> createState() => _BooksCategoryScreenState();
}

class _BooksCategoryScreenState extends State<BooksCategoryScreen> {
  String categoryTitle = "";
  List<Book> displayedBooks = [];
  var _loadedInitData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_loadedInitData){
      final Map<String, String>? routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
      // if (routeArgs == null) {
      //   return Scaffold();
      // }
      categoryTitle = routeArgs?["title"] ?? "title";
      final String categoryId = routeArgs?["id"] ?? "id";
      displayedBooks = widget.availableBooks.where((book) {
        return book.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeBook(String bookID) {
    setState(() {
      displayedBooks.removeWhere((book) => book.id == bookID);
    });

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? "Title"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
            return BookItem(displayedBooks[index].id,
                displayedBooks[index].title,
                displayedBooks[index].imageUrl,
                displayedBooks[index].pages,
                displayedBooks[index].complexity,
                displayedBooks[index].affordable);
      }, itemCount: displayedBooks.length, ),
    );
  }
}
