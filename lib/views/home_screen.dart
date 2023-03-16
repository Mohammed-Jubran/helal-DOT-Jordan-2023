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
                aspectRatio: 1.8,
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
                onTap: (int index) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('On Tap $index'),
                  ));
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
