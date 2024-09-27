import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/model/meal_model.dart';
import 'package:meals/provider/favorites_provider.dart';
import 'package:meals/provider/meals_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meal_screen.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/widgets/meal_item.dart';
import 'package:meals/provider/filters_provider.dart';
// import 'package:meals/provider/meals_provider.dart';
// import 'package:riverpod/riverpod.dart';

const KInitialFIlters = {
   Filterss.glutenfree: false,
    Filterss.Lactosefree: false,
    Filterss.Vegeterian: false,
    Filterss.Vegan: false,
};

class TabScreen extends  ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int selectedPageIndex = 0;
  String activePagetitle = 'Categories';
  // final List<Meal> _FavoriteMeals = [];
  // Map<Filterss,bool> _selectedFilters = KInitialFIlters;//no need to do this now as we are using provider



  // void _toggleMealFavoriteStatus(Meal meal){
  //   final isExisting = _FavoriteMeals.contains(meal);

  //   if(isExisting){
  //     setState(() {
  //         _FavoriteMeals.remove(meal);
  //         showInfomessages('Meal is no longer a Favorite');
  //     });
    
  //   }else{
  //     setState(() {
  //        _FavoriteMeals.add(meal);
  //        showInfomessages('Meal added to Favorites');
  //     });
     
  //   }
  // } // we are handling this now in provider widget 

  void selectedPage(int index){
    setState(() {
      selectedPageIndex = index;
      // print(index);
    });
  }

  void setscreen(String identifier)async{
      Navigator.of(context).pop();
    if(identifier == 'filters'){
     await Navigator.of(context).push<Map<Filterss,bool>>(MaterialPageRoute(builder: (context) => FiltersScreen(),));
    //  print(result);
    // setState(() {
    //    _selectedFilters = result?? KInitialFIlters;
    // });//no longer needed as we are using provider
   
    }
  }

  @override
  Widget build(BuildContext context) {
  final meals = ref.watch(mealprovider);
  final activeFilters = ref.watch(filtersProvider);
    final availablemeals = meals.where((meal){
    if(activeFilters[Filterss.glutenfree]! && !meal.isGlutenFree){
      return false;
    }
    if(activeFilters[Filterss.Lactosefree]! && !meal.isLactoseFree){
      return false;
    }
    if(activeFilters[Filterss.Vegeterian]! && !meal.isVegetarian){
      return false;
    }
    if(activeFilters[Filterss.Vegan]! && !meal.isVegan){
      return false;
    }
    return true;
    }).toList();
    Widget activePage =  CategoryScreen(availableMeals: availablemeals,);

    if(selectedPageIndex == 1){
   final favoritemeals = ref.watch(favoriteMealsProvider);
      activePage = Mealscreen(meals: favoritemeals);
     activePagetitle = 'Your favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePagetitle),
      ),
      drawer: MainDrawer(onSelectScreen:setscreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal_rounded),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
        currentIndex: selectedPageIndex,
        onTap: selectedPage
      ),
    );
  }
}