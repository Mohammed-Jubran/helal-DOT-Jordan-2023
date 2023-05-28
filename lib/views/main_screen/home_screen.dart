import 'package:flutter/material.dart';
import 'package:banner_image/banner_image.dart';
import 'package:helal/controller/category_controller.dart';
import 'package:helal/controller/product_controller.dart';
import 'package:helal/controller/product_provider.dart';
import 'package:helal/model/category_model.dart';
import 'package:helal/model/product_model.dart';
import 'package:helal/views/main_screen/products_screen.dart';
import 'package:provider/provider.dart';

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: FutureBuilder(
              future: CategoryController().getAll(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
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
                          itemCount: snapshot.data!.length,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          itemBuilder: (context, index) {
                            Category category = snapshot.data![index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProductsScreen(categoryId: category.id, categoryName: category.name),));
                              },
                              child: Column(
                                children:  [
                                   Material(
                                     shape: const CircleBorder(),
                                     elevation: 10,
                                     color: Colors.purple,
                                     child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 35,
                                      backgroundImage: NetworkImage(category.image),
                                  ),
                                   ),
                                  const SizedBox(height: 5),
                                  Text(category.name,
                                      style: const TextStyle(
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
                      FutureBuilder(
                        future:  ProductController().getFeaturedProducts(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.connectionState == ConnectionState.done) {
                            return Container(
                              height: ((MediaQuery.of(context).size.height)*.35)-10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFf6f5f4),
                              ),
                              width: double.infinity,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.length,
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                itemBuilder: (context, index) {
                                  Product product = snapshot.data![index];
                                  return InkWell(
                                    onTap: () {
                                      _handleViewProduct(product);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Material(
                                        elevation: 7,
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
                                                    image:  DecorationImage(
                                                        image: NetworkImage(
                                                            product.image),
                                                        fit: BoxFit.cover)),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      product.name,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          fontFamily: "TiltNeon",
                                                          fontSize: 15),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                            "\$${product.price.toStringAsFixed(2)}",
                                                            style: const TextStyle(
                                                                fontFamily:
                                                                "TiltNeon",
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color:
                                                                Colors.purple)),
                                                        SizedBox(width:(MediaQuery.of(context).size.width)*.2),
                                                        Text(
                                                          product.size,
                                                          style: const TextStyle(
                                                              fontSize: 10,
                                                              fontFamily:
                                                              "TiltNeon",
                                                              fontWeight:
                                                              FontWeight.w400),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => const SizedBox(width: 15),
                              ),
                            );
                          }
                          return Container();
                        }
                      ),
                    ],
                  );
                }
                return Container(color: Colors.red,);
              },
            ),
          ),
        ),
      ),
    );
  }
  _handleViewProduct(Product product ) {
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
                        borderRadius:
                        const BorderRadius.all(Radius.circular(5)),
                        child: Container(
                          width: (MediaQuery.of(context).size.width) * .5,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: NetworkImage(product.image),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        product.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'TiltNeon'),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "price per piece : ${product.price.toStringAsFixed(2)} JD",
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontFamily: 'TiltNeon'),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  product.selectedQty++;
                                });
                              },
                              icon: const Icon(Icons.add)),
                          const SizedBox(width: 30),
                          Text(
                            "${product.selectedQty}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 18),
                          ),
                          const SizedBox(width: 30),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (product.selectedQty > 0) {
                                    product.selectedQty--;
                                  }
                                });
                              },
                              icon: const Icon(Icons.remove)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:   [
                          const Text("Total :  ",
                              style: TextStyle(
                                  fontFamily: 'TiltNeon', fontSize: 17)),
                          Text("\$${(product.total).toStringAsFixed(2)}",
                              style: const TextStyle(
                                  fontFamily: 'TiltNeon',
                                  color: Colors.green,
                                  fontSize: 17)),
                          const Text("JD",
                              style: TextStyle(
                                  fontFamily: 'TiltNeon', fontSize: 17)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width) * .5,
                        child: ElevatedButton(
                          onPressed: () {
                            var productProvider = Provider.of<ProductProvider>(context,listen: false);
                            productProvider.addToCart(product);
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
