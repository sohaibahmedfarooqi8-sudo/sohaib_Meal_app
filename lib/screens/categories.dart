import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/models/category.dart';

class CategoriesScree extends StatefulWidget {
  const CategoriesScree({
    super.key,
  required this.avilableMeals
  });
final List<Meal> avilableMeals;
  @override
  State<CategoriesScree> createState() => _CategoriesScreeState();
}

class _CategoriesScreeState extends State<CategoriesScree>
 with SingleTickerProviderStateMixin
 {
late AnimationController __animationController;
@override
void initState(){
  super.initState();

__animationController =AnimationController(
  vsync: this,
  duration: Duration(milliseconds: 300),
  lowerBound: 0,
  upperBound: 1,
);
__animationController.forward();
}
@override
  void dispose() {
   __animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
   final filteredMeals = widget.avilableMeals
   .where((meal) =>meal.categories.contains(category.id)  )
  . toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
           meals: filteredMeals,
           ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation:__animationController,
      child:     GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onselectCategory: () {
                _selectCategory(context ,category);
              },
            ),
        ],
      ), 
       builder:(context ,child)=> SlideTransition(
        position:
        Tween(
          begin:const Offset(0, 0.3),
          end: const Offset(0, 0),       
           ).animate(CurvedAnimation(parent: __animationController,
            curve: Curves.easeInOut,
            
            ),
       )  ,
       child: child,
       ),
    );
  }}

