import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filters_provider.dart';

class FiltersScreen extends ConsumerWidget{
  FiltersScreen({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // var _glutenfreeFilter = false;
   final activefilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
        body: Column(
          children: [
            SwitchListTile(
              value: activefilters[Filterss.glutenfree]!,
              onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setfilter(Filterss.glutenfree,isChecked);
              },
              title: Text(
                'gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(right: 22, left: 34),
            ),
            SwitchListTile(
                value: activefilters[Filterss.Lactosefree]!,
              onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setfilter(Filterss.Lactosefree,isChecked);
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(right: 22, left: 34),
            ),
            SwitchListTile(
                value: activefilters[Filterss.Vegeterian]!,
              onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setfilter(Filterss.Vegeterian,isChecked);
              },
              title: Text(
                'Vegeterain',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Vegeterian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(right: 22, left: 34),
            ),
             SwitchListTile(
                value: activefilters[Filterss.Vegan]!,
              onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setfilter(Filterss.Vegan,isChecked);
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(right: 22, left: 34),
            ),
          ],
        ));
  }
}
