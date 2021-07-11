import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
class CategoryMealScreen extends StatefulWidget {
  static const routName ='category_meals';
  final List<Meal> availableMeal;
  CategoryMealScreen(this.availableMeal);
  @override
  _CategoryMealScreen createState() => _CategoryMealScreen();

}

class _CategoryMealScreen extends State<CategoryMealScreen> {
  String CategoryTitle;
  List<Meal> displayedMeals;
  @override
  void didChangeDependencies() {
    final routArg =ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryid=routArg['id'];
    CategoryTitle=routArg['title'];
    displayedMeals=widget.availableMeal.where((mael){
      return mael.categories.contains(categoryid);
    }).toList();    super.didChangeDependencies();
  }
  
  void _removeMeal(String MealId){
   setState(() {
     displayedMeals.removeWhere((Meal) => Meal.id==MealId);
   });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text(CategoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx,index){
          return MealItem(
            id: displayedMeals[index].id,
            ImageUrl: displayedMeals[index].imageUrl,
            title:  displayedMeals[index].title,
              ingredients: displayedMeals[index].ingredients,
              duration: displayedMeals[index].duration,
              complexity:displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            //    RemoveItem: _removeMeal,

          );

        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
