import 'package:books/Screens/bookDetailScreen.dart';
import 'package:books/models/booksData.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int pages;
  final Complexity complexity;
  final Afforbility affordability;

  BookItem(this.id, this.title, this.imageUrl, this.pages, this.complexity, this.affordability);
  void selectBook(BuildContext context) {
    Navigator.of(context).pushNamed(BookDetailScreen.routeName, arguments: id
    );
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challageing:
        return "Challageing";
      case Complexity.Hard:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  String get affordableText {
    switch (affordability) {
      case Afforbility.Affordable:
        return "Affordable";
      case Afforbility.Pricy:
        return "Pricy";
      case Afforbility.Luxurious:
        return "Luxurious";
      default:
        return "Unknown";
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectBook(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [Stack(
            children: [
              ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
              topRight: Radius.circular(15)),
                child: Image.network(imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover,),
              ),
              Positioned(
              bottom: 5,
                right: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  width: 180,
                  color: Colors.black45,
                  child: Text(title,style: TextStyle(
                    fontSize: 26,color: Colors.white,),
    softWrap: true,overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
            Padding(padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.pages),
                    SizedBox(width: 6,),
                    Text("${pages.toString()} \pages"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work_history),
                    SizedBox(width: 6,),
                    Text(complexityText),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 6,),
                    Text(affordableText),
                  ],
                ),
              ],
            ),)

          ],
        ),
      ),
    );
  }
}
