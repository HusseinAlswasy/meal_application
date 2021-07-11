import 'package:flutter/material.dart';
import '../dummy_data.dart';

class details extends StatelessWidget {
  static const routName = 'Meal_details';
  final Function toggleFavorite;
  final Function isFavorites;

  const details( this.toggleFavorite,this.isFavorites) ;


  Widget Buildsectionswidget(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme
          .of(context)
          .textTheme
          .title),

    );
  }

  Widget BuildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),

      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final MealId = ModalRoute
        .of(context)
        .settings
        .arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((Meal) => Meal.id == MealId);
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
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
            Buildsectionswidget(context, "Ingredients"),
            BuildContainer(ListView.builder(
              itemBuilder: (ctx, index) =>
                  Card(
                    color: Theme
                        .of(context)
                        .accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  ),
              itemCount: selectedMeal.ingredients.length,
            )),
            Buildsectionswidget(context, "Steps"),
            BuildContainer(ListView.builder(
              itemBuilder: (ctx, index) =>ListTile(
                leading: CircleAvatar(
                  child: Text("#${index+1}"),
                ),

                title: Text(selectedMeal.steps[index]),
            ),
              itemCount: selectedMeal.steps.length,
            )),



          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>toggleFavorite(MealId),
        child: Icon(isFavorites(MealId)? Icons.star :Icons.star_border,
        ),
      ),
    );
  }
}
