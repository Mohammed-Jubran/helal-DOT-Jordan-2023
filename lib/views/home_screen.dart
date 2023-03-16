import 'package:flutter/material.dart';
import 'package:banner_image/banner_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final list = [
    'assets/images/1.jpeg',
    'assets/images/4.jpeg',
    'assets/images/3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              BannerImage(
                aspectRatio: 1.9,
                itemLength: list.length,
                withOutIndicator: false,
                selectedIndicatorColor: Colors.purple,
                autoPlay: true,
                borderRadius: BorderRadius.circular(8),
                children: List.generate(
                  list.length,
                  (index) => Image.asset(
                    list[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("CATEGORIES",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'TiltNeon',
                      )),
                ),
              ),
              const SizedBox(height: 25),
              Container(
                color: Colors.pink,
                width: double.infinity,
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) {
                    return Column(
                      children:  [
                        CircleAvatar(
                          backgroundColor: Colors.white70,
                          radius: 35,
                          child: Image.asset("",fit: BoxFit.fill),
                        ),
                        const SizedBox(height: 10),
                        const Text("data"),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(width: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
