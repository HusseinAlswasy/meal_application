import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './FavoritesScreen.dart';
import './category_scree.dart';

class  tabsscreen extends StatefulWidget {

  final List<Meal> favoriteMeal;

  tabsscreen(this.favoriteMeal) ;
  
  @override
  _tabsscreenState createState() => _tabsscreenState();
}

class _tabsscreenState extends State<tabsscreen> {
 List<Map<String, Object>> _page;

  int _selectedTabIndex=0;
  void _selectTab(int value){
   setState(() {
     _selectedTabIndex=value;
   });
  }

@override
  void initState() {
  _page=[
    {
      'page':MyCategoryScreen(),
      'title':'Meals',

    },
    {
      'page':favoritesScreen(widget.favoriteMeal),
      'title':'Your Favorites',
    },
  ];
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_selectedTabIndex]['title']),
      ),
      body:_page[_selectedTabIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor:Theme.of(context).primaryColor,
        selectedItemColor:Theme.of(context).accentColor ,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedTabIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("Meals"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],

      ),
      drawer: MainDrawer(),
    );
  }
}

