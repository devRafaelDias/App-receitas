import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';
import 'screens/tabs_screen.dart';
import 'screens/settings.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Meal> _availableMeals = dummyMeals;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.pink,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          iconTheme: IconThemeData(color: Colors.white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        primarySwatch: Colors.pink,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'Raleway',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => const TabScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => const MealDetaialScreen(),
        AppRoutes.SETTINGS: (ctx) => const SettingsScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const CategoryScreen();
  }
}
