import 'package:books/Screens/mainDrawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function saveFilters;
  final Map<String, bool> cuurentFilters;

  FiltersScreen(this.saveFilters, this.cuurentFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isKidsRelated = false;

  @override
  void initState() {
    isKidsRelated = widget.cuurentFilters["iskidsrelated"]!;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
          actions: [
            IconButton(onPressed: () {
              final selectedFilters = {
                "iskidsrelated": false
              };
              widget.saveFilters(selectedFilters);
              }, icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              child: Text("Adjust your books selection"),
            ),
            Expanded(
                child: ListView(
              children: [
                SwitchListTile(
                  value: isKidsRelated,
                  onChanged: (newValue) {
                    setState(() {
                      isKidsRelated = newValue;
                    });
                  },
                  title: Text("isKidsRelated"),
                )
              ],
            ))
          ],
        ));
  }
}
