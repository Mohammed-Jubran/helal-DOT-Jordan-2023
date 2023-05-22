import 'package:flutter/material.dart';
import 'package:helal/controller/product_provider.dart';
import 'package:helal/model/product_model.dart';
import 'package:helal/views/widget/empty_cart_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer(
          builder: (context, ProductProvider productProvider, child) {
            if(productProvider.selectedProduct.isEmpty){
              return const EmptyCart();
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        childAspectRatio: 2 / 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 0,
                      ),
                      itemCount: productProvider.selectedProduct.length,
                      itemBuilder: (context, index) {
                        Product product =
                            productProvider.selectedProduct[index];
                        return Padding(
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
                                    flex: 4,
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: DecorationImage(
                                              image:
                                                  NetworkImage(product.image),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                product.name,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "TiltNeon",
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                  "\$${product.price.toStringAsFixed(2)}",
                                                  style: const TextStyle(
                                                      fontFamily: "TiltNeon",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.purple)),
                                            ],
                                          ),
                                          Center(
                                            child: Text(
                                              "Quantity: ${product.selectedQty}",
                                              style: const TextStyle(
                                                  fontFamily: "TiltNeon",
                                                  fontSize: 14),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    productProvider.updateQty(product, product.selectedQty +1);
                                                  },
                                                  icon: const Icon(Icons.add,size: 20,)),
                                              Text(
                                                "${product.selectedQty}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green,
                                                    fontSize: 15),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    if(product.selectedQty ==1){
                                                      productProvider.removeProduct(index);
                                                      return;
                                                    }
                                                    productProvider.updateQty(product, product.selectedQty -1);
                                                  },
                                                  icon: product.selectedQty==1
                                                      ?const Icon(Icons.delete,size: 20)
                                                      :const Icon(Icons.remove,size: 20)
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                "total : ",
                                                style: TextStyle(
                                                    fontFamily: "TiltNeon",
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                "\$${(product.total).toStringAsFixed(2)}",
                                                style: const TextStyle(
                                                    fontFamily: "TiltNeon",
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
