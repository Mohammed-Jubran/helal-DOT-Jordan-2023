import 'package:flutter/material.dart';
import 'package:helal/controller/product_provider.dart';
import 'package:helal/views/main_screen/cart_screen.dart';
import 'package:helal/views/main_screen/categories_screen.dart';
import 'package:helal/views/main_screen/home_screen.dart';
import 'package:helal/views/more_screen/more_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helal/views/search_screen.dart';
import 'package:helal/views/widget/with_notification_widget.dart';
import 'package:provider/provider.dart';

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
    return Consumer(
        builder: (context, ProductProvider productProvider, child) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      AppLocalizations.of(context)!.helaL,
                      style: const TextStyle(
                        fontFamily: 'OoohBaby',
                        fontSize: 30,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.market,
                      style: const TextStyle(
                        fontFamily: 'OoohBaby',
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
                leading: const InkWell(
                    child: Icon(Icons.shield_moon_sharp,
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
                items:   [
                   BottomNavigationBarItem(icon: const Icon(Icons.home), label: AppLocalizations.of(context)!.home),
                   BottomNavigationBarItem(
                      icon: const Icon(Icons.category), label: AppLocalizations.of(context)!.categories),
                  BottomNavigationBarItem(
                      icon: productProvider.selectedProduct.isEmpty
                          ? const  Icon(Icons.shopping_cart_sharp)
                          :const WithNotification()
                      , label: AppLocalizations.of(context)!.cart),
                   BottomNavigationBarItem(
                      icon: const Icon(Icons.more_horiz), label: AppLocalizations.of(context)!.more),
                ],
              ),
            ),
          );
        }
    );
  }
}
