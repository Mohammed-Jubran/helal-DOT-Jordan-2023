import 'package:flutter/material.dart';
import 'package:helal/controller/product_controller.dart';
import 'package:helal/model/product_model.dart';
import 'package:helal/views/widget/add_to_cart_widget.dart';
import 'package:helal/views/widget/handle_view_product.dart';
import 'package:helal/views/widget/one_product_cat.dart';

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
                                handleViewProduct(context,product);
                              },
                              child: OneProductCat(product: product),
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
