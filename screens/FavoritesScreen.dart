import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class favoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;

  favoritesScreen(this.favoriteMeal) ;
  @override
  Widget build(BuildContext context) {
    if(favoriteMeal.isEmpty){
      return Center(
        child: Text("you have no favorites yet _ start adding some!"),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx,index){
          return MealItem(
            id: favoriteMeal[index].id,
            ImageUrl:  favoriteMeal[index].imageUrl,
            title:   favoriteMeal[index].title,
            ingredients:  favoriteMeal[index].ingredients,
            duration:  favoriteMeal[index].duration,
            complexity: favoriteMeal[index].complexity,
            affordability:  favoriteMeal[index].affordability,
            //RemoveItem: _removeMeal,

          );

        },
        itemCount:  favoriteMeal.length,
      );
    }

  }
}
