import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetaialScreen extends StatelessWidget {
  const MealDetaialScreen({super.key});

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      width: 350,
      height: 300,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              _createSectionTitle(context, 'Ingredientes'),
              _createSectionContainer(ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Colors.amberAccent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                },
              )),
              _createSectionTitle(context, 'Passos'),
              _createSectionContainer(
                ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(254, 254, 254, 1),
        onPressed: () {
          Navigator.of(context).pop(meal.title);
        },
        child: const Icon(
          Icons.star,
          color: Colors.pink,
        ),
      ),
    );
  }
}
