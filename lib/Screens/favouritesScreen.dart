import 'package:flutter/material.dart';
import '../models/booksData.dart';
import '../Widgets/bookItem.dart';

class FavouritesScreen extends StatelessWidget {
  List<Book> favouriteBooks;

  FavouritesScreen(this.favouriteBooks);

  @override
  Widget build(BuildContext context) {
    if (favouriteBooks.isEmpty) {
      return Center(
        child: Text("You havent picked any favourites"),
      );
    } else {
      return ListView.builder(itemBuilder: (context, index) {
         BookItem(favouriteBooks[index].id,
            favouriteBooks[index].title,
            favouriteBooks[index].imageUrl,
            favouriteBooks[index].pages,
            favouriteBooks[index].complexity,
            favouriteBooks[index].affordable,);
      }, itemCount: favouriteBooks.length);
    }

  }
}
