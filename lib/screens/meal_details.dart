import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/fvorites_provider.dart';
class MealDetailsScreen  extends ConsumerWidget{
  const MealDetailsScreen({super.key,
  required this .meal,
  }
  );
  final Meal meal;


@override
  Widget build(BuildContext context, WidgetRef ref) {
    final FavoriteMeals =ref.watch(favoriteMealsProvider);
    final isFavorite =FavoriteMeals.contains(meal);
 return Scaffold(
  appBar: AppBar(
    title: Text(meal.title),
    actions: [
      IconButton(
        
        onPressed: (){
     final wasAdded=  ref.read(favoriteMealsProvider.notifier)
       .toggleMealfavoriteStatus(meal);
         ScaffoldMessenger.of(context).clearSnackBars();
         ScaffoldMessenger.of(
      context
  )
  .showSnackBar(
    SnackBar
    (content: Text(
      wasAdded ? 'Meal added as favorite':'meal removed ',
   ),
   ),
   );
        },
       icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return RotationTransition(
            turns: Tween<double>(begin: 0.5,end:1 ).animate(animation) ,
            child: child,);
        },
       child:  Icon(isFavorite?Icons.favorite:Icons.favorite_border,
       key: ValueKey(isFavorite),
       ),
       ),
      ),
    ],
    ),
    body: SingleChildScrollView(
      child: Column(
      children: [
         Hero(
          tag: meal.id,
           child: Image.network(
                 meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                 ),
         ) ,
      const SizedBox(height: 14),
      Text(
      'ingrediant',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme .of (context).colorScheme.primary,
        fontWeight:FontWeight.bold, 
      ),
      ),
      const SizedBox(height: 14,),
      for (final ingrediant in meal.ingredients)
        Text(
      ingrediant,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme .of (context).colorScheme.onSurface,
      ),
      ),
      Text(
      'Steps',
       style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme .of (context).colorScheme.primary,
        fontWeight:FontWeight.bold, 

      ),
      ),
      const SizedBox(height: 14),
      for(final step in meal .steps)
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: Text(
            step,
            textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme .of (context).colorScheme.onSurface,
        ),
        ),
      ),
    ],
    ),
    ),
    );
  }
}