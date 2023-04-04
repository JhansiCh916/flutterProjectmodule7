import 'package:books/Screens/booksList.dart';
import '../models/booksData.dart';
import '../Screens/booksCategoryWiseScreen.dart';
import '../Screens/favouritesScreen.dart';
import '../Screens/mainDrawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final List<Book> favouriteBokks;

  TabsScreen(this.favouriteBokks);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<dynamic, dynamic>> _pages = [];
  int _selectedPage = 0;

  void _SelectPage(int index) {
    setState(() {
      _selectedPage = index;
    });

  }

  @override
  void initState() {
    _pages = [
      {"page": Bookslist(),"title": "Categories"},
      {"page": FavouritesScreen(widget.favouriteBokks),"title": "Favourites"}
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text(_pages[_selectedPage]["title"]),
          ),
        drawer: MainDrawer(),
        body: _pages[_selectedPage]["page"],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _SelectPage,
          backgroundColor: Colors.brown,currentIndex: _selectedPage,
          selectedItemColor: Colors.white,
            unselectedItemColor: Colors.teal,
            items: [
            BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
        ],
        ),
    );
  }
}
