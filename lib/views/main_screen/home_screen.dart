import 'package:flutter/material.dart';
import 'package:banner_image/banner_image.dart';
import 'package:helal/views/main_screen/products_screen.dart';

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
                aspectRatio: 2.7,
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
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductsScreen(),));
                      },
                      child: Column(
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
                      ),
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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFf6f5f4),
                  ),
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          _handleViewProduct();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Material(
                            elevation: 7,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xFFf6f5f4),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      width: (MediaQuery.of(context).size.width) *
                                          .40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: const DecorationImage(
                                              image: ExactAssetImage(
                                                  "assets/images/11.jpeg"),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                          const Text("Honey Gel",style: TextStyle(fontWeight: FontWeight.w600,fontFamily: "TiltNeon",fontSize: 15),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center  ,
                                            children: const [
                                              Text("\$18.5/",style: TextStyle(fontFamily:"TiltNeon",fontWeight:FontWeight.bold,color: Colors.purple)),
                                              Text("500ml",style: TextStyle(fontSize: 10,fontFamily:"TiltNeon",fontWeight: FontWeight.w400),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _handleViewProduct() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return SizedBox(
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Material(
                        elevation: 9.5,
                        shadowColor: Colors.purple,
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        child: Container(
                          width:(MediaQuery.of(context).size.width) *.5,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: const DecorationImage(
                                  image: ExactAssetImage(
                                      "assets/images/11.jpeg"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Honey Gel",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18,fontFamily: 'TiltNeon'),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "price per piece : 1.75 JD",
                        style: TextStyle(fontSize: 14, color: Colors.grey,fontFamily: 'TiltNeon'),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                });
                              },
                              icon: const Icon(Icons.add)),
                          const SizedBox(width: 30),
                          const Text(
                            "0",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 18),
                          ),
                          const SizedBox(width: 30),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                });
                              },
                              icon: const Icon(Icons.remove)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Total :  ",style: TextStyle(fontFamily: 'TiltNeon',fontSize: 17)),
                          Text("1.75  ",style: TextStyle(fontFamily: 'TiltNeon',color: Colors.green,fontSize: 17)),
                          Text("JD",style: TextStyle(fontFamily: 'TiltNeon',fontSize: 17)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width) *.5,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                          ),
                          child: const Text(
                            "Add to cart",
                            style: TextStyle(
                                fontFamily: 'TiltNeon',
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
