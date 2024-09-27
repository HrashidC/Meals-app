

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filterss{
  glutenfree,
  Lactosefree,
  Vegeterian,
  Vegan
}

class FiltersNotifier extends StateNotifier<Map<Filterss,bool>>{
FiltersNotifier() : super({
  Filterss.glutenfree: false,
  Filterss.Lactosefree: false,
  Filterss.Vegeterian: false,
  Filterss.Vegan: false,
});
void setfilters(Map<Filterss,bool> chosenfilter){
state = chosenfilter;

}

void setfilter(Filterss filter,bool isActive){
state = {
  ...state,
  filter: isActive
};
}
}

final filtersProvider = StateNotifierProvider<FiltersNotifier,Map<Filterss,bool>>((ref) => FiltersNotifier());