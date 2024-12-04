import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../core/constants/app_colors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryCoffee,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Icon(IconData(0xe178,fontFamily: 'MaterialIcons'),
            size : 100,
            color: Colors.white), 
            Text(
              'Welcome to Coffee Lovaaa',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Enter Home'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor:  AppColors.primaryCoffee,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
