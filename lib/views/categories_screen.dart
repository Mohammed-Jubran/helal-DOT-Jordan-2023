import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<Map> myCategories = List.generate(
      20, (index) => {"id": index, "name": "Categories ${index + 1}"}).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: myCategories.length,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("assets/images/5.jpg"), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(15)),
              child: Text(myCategories[index]["name"],style: TextStyle(color: Colors.purple),),
            );
          },
        ),
      ),
    );
  }
}
