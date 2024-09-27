import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/model/meal_model.dart';
import 'package:meals/provider/favorites_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({super.key, required this.meal});
  final Meal meal;
  // final void Function(Meal meal) onToggleFavorites;//handled in provider
  // final NetworkImage image;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritemeals = ref.watch(favoriteMealsProvider);
    final isfavorite = favoritemeals.contains(meal);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(wasAdded
                        ? 'Meal is added to Favorites'
                        : 'Meal is removed from Favorites')));
              },icon:AnimatedSwitcher(duration: Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => RotationTransition(turns: Tween<double>(begin: 0.8,end:1.0 ).animate(animation),child: child,),
              child: Icon(isfavorite ? Icons.star : Icons.star_border,key: ValueKey(isfavorite),),) )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            for (final ingridients in meal.ingredients)
              Text(
                ingridients,
                style: TextStyle(color: Colors.white),
              ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            for (final step in meal.steps)
              Text(
                step,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
