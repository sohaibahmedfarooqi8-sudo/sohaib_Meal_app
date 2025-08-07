
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
   FavoriteMealsNotifier(): super([]);
   bool toggleMealfavoriteStatus(Meal meal){
    final mealsFavorite = state.contains(meal);

    if (mealsFavorite){
      state =state .where((m)=> m.id != meal.id) .toList();
return false;
    }else{
    state=[...state,meal];
    return true;
   }
   }
}
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref){
return FavoriteMealsNotifier();
});