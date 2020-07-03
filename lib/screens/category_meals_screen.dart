import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = '/category-meals';
  final List<Meal> _availableMeals;

  CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryName;
  List<Meal> categoryDisplayedMeals;
  bool _loadedInitialData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitialData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
      final categoryId = routeArgs['id'];
      categoryName = routeArgs['title'];
      categoryDisplayedMeals = widget._availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitialData = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryDisplayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: ListView.builder(
        itemCount: categoryDisplayedMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryDisplayedMeals[index].id,
            title: categoryDisplayedMeals[index].title,
            imageUrl: categoryDisplayedMeals[index].imageUrl,
            duration: categoryDisplayedMeals[index].duration,
            affordability: categoryDisplayedMeals[index].affordability,
            complexity: categoryDisplayedMeals[index].complexity,
          );
        },
      ),
    );
  }
}
