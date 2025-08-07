import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/fvorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';
const kInitialFilters ={
Filter .glutenfree:false,
Filter .lactosefree:false,
Filter .vegetarian:false,
Filter .vegan:false,

 
};
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenStatae();
  }
}

class _TabsScreenStatae extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
      Navigator.of(context).pop();
    if(identifier=='filters'){
   await Navigator .of(context).push<Map<Filter,bool>>(
    MaterialPageRoute(
    builder: (ctx)=>const FiltersScreen(
    ),
    ),
    );
  
  }
  }
  @override
  Widget build(BuildContext context) {
   
final avilableMeals= ref.watch(filteredMealsprovider);

    Widget activePage = CategoriesScree(
      avilableMeals: avilableMeals,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      final favoriteMeals= ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorite';
    }
return WillPopScope(
  onWillPop: () async {
    if (_selectedPageIndex != 0) {
      setState(() {
        _selectedPageIndex = 0;
      });
      return false; // prevent app from closing
    }
    return true; // allow app to close if already on Categories tab
  },
  child: Scaffold(
    appBar: AppBar(title: Text(activePageTitle)),
    drawer: MainDrawer(onSlectScreeeen: _setScreen),
    body: activePage,
    bottomNavigationBar: BottomNavigationBar(
      onTap: _selectedPage,
      currentIndex: _selectedPageIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.set_meal),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Favorites'),
      ],
    ),
  ),
);


  }
}
