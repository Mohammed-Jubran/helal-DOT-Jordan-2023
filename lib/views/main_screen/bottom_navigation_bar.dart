import 'package:flutter/material.dart';
import 'package:helal/views/about_us_screen.dart';
import 'package:helal/views/cart_screen.dart';
import 'package:helal/views/categories_screen.dart';
import 'package:helal/views/home_screen.dart';
import 'package:helal/views/more_screen.dart';
import 'package:helal/views/search_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedTab = 0;

  final List _pages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const MoreScreen(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "HelaL",
                style: TextStyle(
                  fontFamily: 'OoohBaby',
                  fontSize: 30,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                " Market",
                style: TextStyle(
                  fontFamily: 'OoohBaby',
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          centerTitle: true,
          leading: const InkWell(
              child: Icon(Icons.shield_moon_outlined,
                  color: Colors.purple, size: 40)),
          actions:  [
            InkWell(child: const Icon(Icons.search, size: 40, color: Colors.purple),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen(),));
            }),
            const SizedBox(width: 10),
          ],
        ),
        body: _pages[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 7,
          backgroundColor: const Color(0xFFf2f2f2),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: "More"),
          ],
        ),
      ),
    );
  }
}
