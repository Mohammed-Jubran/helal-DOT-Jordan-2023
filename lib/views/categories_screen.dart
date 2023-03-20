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
            childAspectRatio: 3 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: myCategories.length,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xFFA020F0).withOpacity(0.15 ),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10,right: 10,left: 10,bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/5.jpg"),
                          fit: BoxFit.cover,
                          opacity:.6 ,
                        )
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                      child: Text(
                    myCategories[index]["name"],
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        fontFamily: "TiltNeon"),
                  )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
