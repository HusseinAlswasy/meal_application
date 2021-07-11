import 'package:flutter/material.dart';
import '../screens/Filters.dart';

class MainDrawer extends StatelessWidget {
  Widget BuildKList(String title,IconData icon,Function Tap){
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      onTap: Tap,
    );

  }
  @override

  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
         BuildKList('Meal', Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          BuildKList('Settings', Icons.settings,(){Navigator.of(context).pushReplacementNamed(FilterScreeen.routeName);}),
        ],
      ),
    );
  }
}
