import 'package:books/Screens/filterScreen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListFile(String text, Icon icon, VoidCallback tapHandler) {
    return ListTile(
      leading: icon,
      title: Text(text,style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.black45,
            height: 50,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text("Books", style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold, color: Colors.white),),
          ),
          SizedBox(
            height: 10,
          ),
          buildListFile("Meals", Icon(Icons.store), () { Navigator.of(context).pushReplacementNamed("/");}),
          buildListFile("Filters", Icon(Icons.settings),() {Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),
        ],
      ),
    );
  }
}
