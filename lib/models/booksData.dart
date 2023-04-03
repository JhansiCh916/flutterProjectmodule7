import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challageing, Hard }
enum Afforbility {
  Affordable,
  Pricy,
  Luxurious
}

class Book {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> description;
  final int pages;
  final Complexity complexity;
  final Afforbility affordable;
  final bool isItOkToKids;

  const Book(this.id, this.categories, this.title, this.imageUrl, this.description, this.pages, this.complexity, this.affordable, this.isItOkToKids);
}