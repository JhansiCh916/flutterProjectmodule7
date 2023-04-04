import '../dummyCategories.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  static final routeName = "/bookDetailScreen";
  final Function togglefavourite;
  final Function isFavourite;

  BookDetailScreen(this.togglefavourite, this.isFavourite);

  Widget _buildDescriptionWidget(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Text(text),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(color: Colors.brown)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final String? bookDetailId =
        ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal =
        DummyBooksData.firstWhere((book) => book.id == bookDetailId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildDescriptionWidget("Description"),
            _buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  child: Text(
                    selectedMeal.description[index],
                    style: TextStyle(color: Colors.cyan),
                  ),
                ),
                itemCount: selectedMeal.description.length,
              ),
            ),
            _buildDescriptionWidget("Steps"),
            _buildContainer(ListView.builder(
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(child: Text("${(index + 1)}")),
                title: Text(selectedMeal.description[index]),
              ),
              itemCount: selectedMeal.description.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavourite(bookDetailId) ? Icons.star : Icons.star_border),
        onPressed: () =>
          togglefavourite(bookDetailId)
        ,
      ),
    );
  }
}
