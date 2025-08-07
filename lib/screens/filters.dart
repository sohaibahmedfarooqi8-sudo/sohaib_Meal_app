import 'package:flutter/material.dart';

// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FiltersScreen extends ConsumerWidget {
  const FiltersScreen ({super.key, });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters =ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('your filters'),
      ),
body: 
 Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filter.glutenfree]!,
            onChanged: (isChecked){
              ref 
              .read(filtersProvider.notifier)
              .setFilter(Filter.glutenfree,isChecked
              );
            },
            title:Text(
              'Gulten _free',
            style :Theme.of(context).textTheme.titleLarge!.copyWith(
              color:Theme.of(context).colorScheme.onSurface,
            ),
            
            ),
            subtitle: Text(
              'Only include the gulten_free meals',
             style :Theme.of(context).textTheme.titleLarge!.copyWith(
              color:Theme.of(context).colorScheme.onSurface,
            ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left:34,right:22),
            ),
             SwitchListTile(
              value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked){
              ref 
              .read(filtersProvider.notifier)
              .setFilter(Filter.vegetarian,isChecked
              );
            },
            title:Text(
              'lctose _free',
            style :Theme.of(context).textTheme.titleLarge!.copyWith(
              color:Theme.of(context).colorScheme.onSurface,
            ),
            
            ),
            subtitle: Text(
              'Only include the Lactose_free meals',
             style :Theme.of(context).textTheme.titleLarge!.copyWith(
              color:Theme.of(context).colorScheme.onSurface,
            ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left:34,right:22),
            ),
            
             SwitchListTile(
                  value: activeFilters[Filter.lactosefree]!,
            onChanged: (isChecked){
              ref 
              .read(filtersProvider.notifier)
              .setFilter(Filter.lactosefree,isChecked
              );
            },
            
            title:Text(
              'vegetrain',
            style :Theme.of(context).textTheme.titleLarge!.copyWith(
              color:Theme.of(context).colorScheme.onSurface,
            ),
            
            ),
            subtitle: Text(
              'Only include the vegetarian meals',
             style :Theme.of(context).textTheme.titleLarge!.copyWith(
              color:Theme.of(context).colorScheme.onSurface,
            ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left:34,right:22),
            ),
               SwitchListTile(
                 value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked){
              ref 
              .read(filtersProvider.notifier)
              .setFilter(Filter.vegan,isChecked
              );
            },
            title:Text(
              'veg ',
            style :Theme.of(context).textTheme.titleLarge!.copyWith(
              color:Theme.of(context).colorScheme.onSurface,
            ),
            
            ),
            subtitle: Text(
              'Only include the vegan meals',
             style :Theme.of(context).textTheme.titleLarge!.copyWith(
              color:Theme.of(context).colorScheme.onSurface,
            ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left:34,right:22),
            ),
          ],
        ),
    );
}
}