import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';

void main() {
  runApp(RecipeBookApp());
}

class RecipeBookApp extends StatefulWidget {
  @override
  _RecipeBookAppState createState() => _RecipeBookAppState();
}

class _RecipeBookAppState extends State<RecipeBookApp> {
  List<String> recipes = [
    'Pasta',
    'Pizza',
    'Salad',
    'Biryani',
    'Butter Chicken',
    'Fish Fry'
  ];
  List<String> favoriteRecipes = [];

  void toggleFavorite(String recipe) {
    setState(() {
      if (favoriteRecipes.contains(recipe)) {
        favoriteRecipes.remove(recipe);
      } else {
        favoriteRecipes.add(recipe);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: HomeScreen(
        recipes: recipes,
        favoriteRecipes: favoriteRecipes,
        toggleFavorite: toggleFavorite,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> recipes;
  final List<String> favoriteRecipes;
  final Function(String) toggleFavorite;

  HomeScreen({
    required this.recipes,
    required this.favoriteRecipes,
    required this.toggleFavorite,
  });

  final Map<String, String> recipeImages = {
    'Pasta':
        'https://www.inspiredtaste.net/wp-content/uploads/2018/12/Easy-Pasta-Salad-Recipe-2-1200.jpg',
    'Pizza':
        'https://static.spotapps.co/spots/b2/e510cf29ee48dfb9877cb567117ce5/:original',
    'Salad':
        'https://www.inspiredtaste.net/wp-content/uploads/2024/03/Italian-Chopped-Salad-Recipe.jpg',
    'Biryani':
        'https://static.toiimg.com/thumb/53094793.cms?imgsize=178546&width=800&height=800',
    'Butter Chicken':
        'https://www.feastingathome.com/wp-content/uploads/2017/11/Butter-Chicken-17.jpg',
    'Fish Fry':
        'https://happietrio.com/wp-content/uploads/2024/01/coastalfishfryyt-1024x681.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe Book')),
      backgroundColor: Colors.orange[50],
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    recipeImages[recipes[index]]!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.image_not_supported),
                  ),
                  title: Text(recipes[index]),
                  trailing: Icon(
                    favoriteRecipes.contains(recipes[index])
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: favoriteRecipes.contains(recipes[index])
                        ? Colors.red
                        : null,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          recipeName: recipes[index],
                          isFavorite: favoriteRecipes.contains(recipes[index]),
                          toggleFavorite: toggleFavorite,
                          imageUrl: recipeImages[recipes[index]]!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(
                    favoriteRecipes: favoriteRecipes,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            child: Text('View Favorites'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
