// ignore_for_file: library_private_types_in_public_api

import 'package:advice_me/Util/constants_values.dart';
import 'package:advice_me/view/add_item_screen.dart';
import 'package:advice_me/view/home/home_screen.dart';
import 'package:advice_me/view/latest_products_screen.dart';
import 'package:advice_me/view/recommendation_screen.dart';
import 'package:advice_me/view/top_rated_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> Screens = [
    const HomeScreen(),
    const LatestProductsScreen(),
    const AddItemScreen(),
    const TopRatedScreen(),
    const RecommendationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onItemTapped(2);
        },
        backgroundColor: ConstValues.MainColor,
        shape: CircleBorder(),
        elevation: 4,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: _selectedIndex == 0 ? ConstValues.MainColor : Colors.grey,
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.search),
              color: _selectedIndex == 1 ? ConstValues.MainColor : Colors.grey,
              onPressed: () => _onItemTapped(1),
            ),
            SizedBox(width: 40), // مكان الزر الطاير
            IconButton(
              icon: Icon(Icons.notifications),
              color: _selectedIndex == 3 ? ConstValues.MainColor : Colors.grey,
              onPressed: () => _onItemTapped(3),
            ),
            IconButton(
              icon: Icon(Icons.person),
              color: _selectedIndex == 4 ? ConstValues.MainColor : Colors.grey,
              onPressed: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}
