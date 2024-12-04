import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/coffee_provider.dart';
import '../widgets/coffee_card.dart';
import 'coffee_detail_screen.dart';

class CoffeeListScreen extends StatelessWidget {
  final String type;

  const CoffeeListScreen({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coffeeProvider = Provider.of<CoffeeProvider>(context);
    final coffees = type == 'hot' ? coffeeProvider.hotCoffees : coffeeProvider.icedCoffees;

    return Scaffold(
      appBar: AppBar(
        title: Text(type == 'hot' ? 'Hot Coffees' : 'Iced Coffees'),
      ),
      body: coffeeProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: coffees.length,
              itemBuilder: (context, index) {
                final coffee = coffees[index];
                return CoffeeCard(
                  coffee: coffee,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CoffeeDetailScreen(coffee: coffee),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
