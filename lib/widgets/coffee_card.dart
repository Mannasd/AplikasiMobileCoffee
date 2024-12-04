import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/coffee_model.dart';
import '../providers/coffee_provider.dart';

class CoffeeCard extends StatelessWidget {
  final CoffeeModel coffee;
  final VoidCallback onTap;

  const CoffeeCard({Key? key, required this.coffee, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coffeeProvider = Provider.of<CoffeeProvider>(context);
    final isFavorite = coffeeProvider.favoriteCoffees.contains(coffee);

    

    return Card(
      child: ListTile(
        leading: Image.network(
          coffee.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
        ),
        title: Text(coffee.title),
        subtitle: Text(coffee.description, maxLines: 1, overflow: TextOverflow.ellipsis),
        trailing: IconButton(
          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          color: isFavorite ? Colors.red : null,
          onPressed: () {
            coffeeProvider.toggleFavorite(coffee);
          },
        ),
        onTap: onTap,
      ),
    );
  }
  
}
