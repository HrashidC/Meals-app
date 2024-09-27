import 'package:flutter/material.dart';
import 'package:meals/model/category_model.dart';
import 'package:meals/screens/meal_screen.dart';

class category_grid_item extends StatelessWidget {
  const category_grid_item({super.key,required this.category,required this.onselectCategory});
final Categorymodel category;
final void Function() onselectCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onselectCategory();
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
             category.color.withOpacity(0.55),
            category.color.withOpacity(
              0.9
            ),
          ],begin: Alignment.topLeft,
          end: Alignment.bottomRight
          )
        ),
        child: Text(category.title,style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),),
      ),
    );
  }
}