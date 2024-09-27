import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/model/category_model.dart';
import 'package:meals/model/meal_model.dart';
import 'package:meals/screens/meal_screen.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key,required this.availableMeals});

// final void Function(Meal meal) onToggleFavorites; //handled in provider
final List<Meal> availableMeals;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with SingleTickerProviderStateMixin{
  late AnimationController animationController; 
@override
void initState() {
  super.initState();
animationController =  AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 300),
    lowerBound: 0,
    upperBound: 1,
    );
  animationController.forward();
}
@override
void dispose() {
  animationController.dispose();
  super.dispose();
}


void selectCategory(BuildContext context, Categorymodel category) {
  final filteredcategory = widget.availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => Mealscreen(title: category.title, meals: filteredcategory,),
  ));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
      animation: animationController, 
      builder: (context, child) => SlideTransition(position: Tween(begin: Offset(0, 0.3),end: Offset(0,0)).animate(CurvedAnimation(parent: animationController, curve: Curves.easeInOut)),
      child: child,),
      child:GridView(
        padding: EdgeInsets.all(24),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            childAspectRatio: 3/2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
        children:  [
        //also can be written as
        // ...availableCategories.map((categoryloop) => category_grid_item(category: categoryloop)).toList(),  
        for(final categoryloop in availableCategories)
        category_grid_item(category: categoryloop,onselectCategory: () {
          selectCategory(context,categoryloop);
        },)
        ],
      ) ,) 
    );
  }
}
