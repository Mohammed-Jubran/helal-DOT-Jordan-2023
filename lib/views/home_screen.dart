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
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              BannerImage(
                aspectRatio: 2.1,
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
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 110,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemBuilder: (context, index) {
                    return Column(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 35,
                          backgroundImage: AssetImage("assets/images/5.jpg"),
                        ),
                        SizedBox(height: 5),
                        Text("fruits",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'TiltNeon',
                                color: Colors.black)),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 15),
                ),
              ),
              const SizedBox(height: 5),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("FEATURED PRODUCTS",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'TiltNeon',
                      )),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset(""),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                  const SizedBox(width: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
