import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/coffee_provider.dart';
import 'coffee_detail_screen.dart';
import '../widgets/coffee_card.dart'; // Pastikan widget CoffeeCard sudah dibuat

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coffeeProvider = Provider.of<CoffeeProvider>(context);
    final favoriteCoffees = coffeeProvider.favoriteCoffees;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: favoriteCoffees.isEmpty
          ? Center(child: Text('No favorites yet!'))
          : ListView.builder(
              itemCount: favoriteCoffees.length,
              itemBuilder: (context, index) {
                final coffee = favoriteCoffees[index];
                return CoffeeCard(
                  coffee: coffee,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CoffeeDetailScreen(coffee: coffee),
                      ),
                    );// Navigasi ke halaman detail jika diperlukan
                  },
                );
              },
            ),
    );
  }
}
