import 'package:flutter/material.dart';
import './screens/Filters.dart';
import './screens/tabs_screens.dart';
import './screens/category_details_screen.dart';
import './screens/category_meal_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters={
  'gluten' : false,
    'vegetarian' : false,
  'vegan' : false,
    'lactose' : false,

  };
  List<Meal> _availableMeal=DUMMY_MEALS;
  List<Meal> _favoriteMeal=[];



  void _setFilters (Map<String,bool> _filterData){
  setState(() {
    _filters=_filterData;
    _availableMeal =DUMMY_MEALS.where((Meal) {

     if(_filters['gluten']&& !Meal.isGlutenFree) {
       return false;
     };
     if(_filters['Lactose']&& !Meal.isLactoseFree) {
       return false;
     }
     if(_filters['vegan']&& !Meal.isVegan) {
       return false;
     }
     if(_filters['vegetarian']&& !Meal.isVegetarian) {
       return false;
     }
     return true;
    }).toList();
  });
  }

  void _toggleFavorite(String mealId){
   final existingIndex =_favoriteMeal.indexWhere((meal) => meal.id==mealId);
   if (existingIndex>=0){
     setState(() {
       _favoriteMeal.removeAt(existingIndex);
     });
   }

   else{
     setState(() {
       _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) =>meal.id==mealId));
     });
   }
  }

  bool _isMealFavorites(String id){
    return _favoriteMeal.any((meal) => meal.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  fontFamily: ' RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              )
      ),
      //home:MyHomePage() ,
      routes: {
        '/':(context)=> tabsscreen(_favoriteMeal),
        CategoryMealScreen.routName:(context)=>CategoryMealScreen(_availableMeal),
        details.routName:(context)=>details(_toggleFavorite,_isMealFavorites),
        FilterScreeen.routeName:(context)=>FilterScreeen(_setFilters),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Meal Application")),
      ),
      body: null,
    );
  }
}
