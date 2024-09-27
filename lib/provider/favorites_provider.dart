import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/model/meal_model.dart';
class FavoritemealsNotifier extends StateNotifier<List<Meal>>{
  FavoritemealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal){
   final mealisFavorite = state.contains(meal);

   if(mealisFavorite){
    state = state.where((m) => m.id != meal.id).toList();
    return false;
   }else{
   }
    state = [...state,meal];
    return true;
  }
}

final favoriteMealsProvider= StateNotifierProvider<FavoritemealsNotifier,List<Meal>> (
  (ref) {
    return FavoritemealsNotifier();
  },
);