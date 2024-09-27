import 'package:meals/data/dummy_data.dart';
import 'package:riverpod/riverpod.dart';

final mealprovider = Provider(
  (ref) {
    return dummyMeals;
  },
);