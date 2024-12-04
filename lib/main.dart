import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/coffee_provider.dart';
import 'core/constants/app_colors.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CoffeeProvider()),
      ],
      child: MaterialApp(
        title: 'Coffee Lover',
        theme: ThemeData(
          primaryColor: AppColors.primaryCoffee,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
