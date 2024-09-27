import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/model/meal_model.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class Mealitem extends StatelessWidget {
  const Mealitem({super.key, required this.meal,required this.onSelectMeal});
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  String get compexityText{
    return
    meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }
   String get affordibilityText{
    return
    meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          clipBehavior: Clip.hardEdge,   children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,height: 200,width: double.infinity,
                  ),
            ),
                
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                    color: Colors.black54,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 44),
                      child: Column(
                        children: [
                          Text(
                            meal.title,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MEalItemTrait(icon: Icons.timer,label: '${meal.duration} min',),
                               MEalItemTrait(icon: Icons.work,label: compexityText),
                                MEalItemTrait(icon: Icons.monetization_on,label: affordibilityText),
                            ],
                          )
                        ],
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
