import 'package:flutter/material.dart';
import 'package:meals/model/meal_model.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/widgets/meal_item.dart';

class Mealscreen extends StatelessWidget {
  const Mealscreen({super.key,  this.title,required this.meals});
  final String? title;
  final List<Meal>meals; //list of meals from dummy data of meal 
  // final void Function(Meal meal) onToggleFavorites; //handled in provider

  void selectmeal(BuildContext context,Meal meal){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MealDetails(meal: meal,),));
  }

  // final Map<String,List<String>> catgwithId  = {
  //   'c2': []
  // }

  @override
  Widget build(BuildContext context) {
  Widget content =
   Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
          child: Text('uh oh...no category found',style:Theme.of(context).textTheme.headlineLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
        ),
        SizedBox(height: 30,),
        Text('Try selecting a different category',style:Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
      ],
    ),
  );


    if(meals.isNotEmpty){
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx,index){
          return Mealitem(meal:meals[index],onSelectMeal: (meal){
            selectmeal(context, meal); 
          },);
        },
      );
    }
if(title == null){
  return content;
}
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}