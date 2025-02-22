import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String recipeName;
  final bool isFavorite;
  final Function(String) toggleFavorite;
  final String imageUrl;

  DetailsScreen({
    required this.recipeName,
    required this.isFavorite,
    required this.toggleFavorite,
    required this.imageUrl,
  });

  final Map<String, String> recipeDetails = {
    'Salad':
        'Ingredients: Leafy greens, vegetables, cheese, protein, seasonings.\nProcess: Wash, dry greens, chop vegetables, mix with dressing.',
    'Pizza':
        'Ingredients: Flour, yeast, salt, sugar, olive oil, tomato sauce, cheese, toppings.\nProcess: Prepare dough, add toppings, bake at high temperature.',
    'Pasta':
        'Ingredients: Flour, water, eggs, salt, olive oil.\nProcess: Mix ingredients, shape, cook.',
    'Biryani':
        'Ingredients: Rice, marinated meat, yogurt, spices, onions, saffron, mint.\nProcess: Marinate meat, layer with rice, cook.',
    'Butter Chicken':
        'Ingredients: Chicken, garam masala, lemon juice, butter, onions, spices.\nProcess: Cook chicken in spiced tomato sauce, add butter.',
    'Fish Fry':
        'Ingredients: Fish, seasonings, flour, oil.\nProcess: Marinate, fry at 350°F until crispy.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipeName)),
      backgroundColor: Colors.orange[50],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.image_not_supported), // Show fallback icon
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recipe Details:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 5),
                Text(recipeDetails[recipeName] ?? 'No details available.'),
              ],
            ),
          ),
          Spacer(), // Pushes the button to the center vertically
          Center(
            child: ElevatedButton(
              onPressed: () {
                toggleFavorite(recipeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Background color
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text(isFavorite ? 'Unfavorite' : 'Favorite'),
            ),
          ),
          SizedBox(height: 50), // Adds space below the button
        ],
      ),
    );
  }
}
