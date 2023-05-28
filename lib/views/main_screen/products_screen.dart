import 'package:flutter/material.dart';
import 'package:helal/controller/product_controller.dart';
import 'package:helal/controller/product_provider.dart';
import 'package:helal/model/product_model.dart';
import 'package:helal/views/widget/add_to_cart_widget.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  final int categoryId;
  final String categoryName;

  const ProductsScreen(
      {Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late int receivedCategoryId;
  late String receivedCategoryName;

  @override
  void initState() {
    super.initState();
    receivedCategoryId = widget.categoryId;
    receivedCategoryName = widget.categoryName;
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ProductController().getByCategoryId(receivedCategoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text(receivedCategoryName,
                      style: const TextStyle(fontFamily: 'TiltNeon')),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 0,
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Product product = snapshot.data![index];
                            return InkWell(
                              onTap: () {
                                _handleViewProduct(product);
                              },
                              child: Padding(padding: const EdgeInsets.symmetric(vertical: 10),
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
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                image: DecorationImage(
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const AddToCartWidget(),
                  ],
                ),
              ),
            );
          }
          return Container();
        });
  }
}
